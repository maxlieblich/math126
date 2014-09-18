import os
import re
import tempfile
import zipfile

try:
    from cStringIO import StringIO as BytesIO
except ImportError:
    from io import BytesIO

import xml.etree.ElementTree as ElementTree

EPUB_URI = 'http://www.idpf.org/2007/opf'
XHTML_URI = 'http://www.w3.org/1999/xhtml'

CHAPTER_REGEX = re.compile(r'ch\d+\.xhtml')

def parse_xml(file, uri=XHTML_URI):
    ElementTree.register_namespace('', uri)
    if uri == XHTML_URI:
        ElementTree.register_namespace('epub', EPUB_URI)

    xmltree = ElementTree.parse(file)
    if uri == XHTML_URI:
        xmltree.getroot().set('xmlns:epub', EPUB_URI)

    return xmltree

class EpubUpdater:
    def __init__(self, oldpath, newpath):
        self._old = zipfile.ZipFile(oldpath, 'r')
        self._new = zipfile.ZipFile(newpath, 'w')
        self._contentopf = parse_xml(self._old.open('content.opf'), uri=EPUB_URI)
        self._manifest = self._contentopf.find('{%s}manifest'%EPUB_URI)
        self._extra_headers = []
        self._closed = False

    def __del__(self):
        self.close()

    def close(self):
        if self._closed:
            return
        self._write_headers()
        self._write_xml('content.opf', self._contentopf, uri=EPUB_URI)
        self._copy_missing()
        self._old.close()
        self._new.close()
        self._closed = True

    def _write_xml(self, path, xmltree, uri=XHTML_URI):
        ElementTree.register_namespace('', uri)
        if uri == XHTML_URI:
            ElementTree.register_namespace('epub', EPUB_URI)
        buf = BytesIO()
        xmltree.write(buf, encoding='UTF-8', xml_declaration=True)
        self._new.writestr(self._old.getinfo(path), buf.getvalue())
        buf.close()

    def _write_headers(self):
        if not self._extra_headers:
            return
        for item in self._manifest:
            href = item.get('href')
            if not CHAPTER_REGEX.match(href):
                continue
            item.set('properties', 'scripted')
            xmltree = parse_xml(self._old.open(href))
            head = xmltree.find('{%s}head'%XHTML_URI)
            for header in self._extra_headers:
                head.append(header)
            self._write_xml(href, xmltree)

    def _copy_missing(self):
        updated = {f.filename for f in self._new.filelist}
        for f in self._old.filelist:
            if f.filename not in updated:
                self._new.writestr(f, self._old.read(f))

    def add_scripts(self, scripts):
        paths = set()
        for script in scripts:
            path = os.path.join('js', os.path.basename(script))
            self._new.write(script, path, zipfile.ZIP_DEFLATED)
            paths.add(path)

        for path in paths:
            self._manifest.append(
                    ElementTree.SubElement(self._manifest, 'item',
                        attrib = {
                            'id': path.replace('/','_').replace('.','_'),
                            'href': path,
                            'media-type': 'text/javascript',
                            },
                        )
                    )

    def add_script(self, script):
        self.add_scripts((script,))

    def add_headers(self, headers):
        for header in headers:
            self._extra_headers.append(ElementTree.fromstring(header))

    def add_header(self, header):
        self.add_headers((header,))

def create_parser():
    import argparse
    parser = argparse.ArgumentParser(description="post-process pandoc epubs")
    parser.add_argument('--input', required=True, help='epub to post-process')
    parser.add_argument('--output', required=True, help='post-processed epub destination')
    parser.add_argument('--mathjax', help='MathJax source directory')
    parser.add_argument('--include-in-headers', help='file to include in headers')
    parser.add_argument('scripts', nargs=argparse.REMAINDER, help='extra scripts to include')

    return parser

if __name__ == '__main__':
    parser = create_parser()
    args = parser.parse_args()

    try:
        epub = EpubUpdater(args.input, args.output)
        epub.add_scripts(args.scripts)

        #if args.mathjax:
        #    epub.embed_mathjax()
        if args.include_in_headers:
            epub.add_headers(open(args.include_in_headers))

        epub.close()
    except Exception:
        os.unlink(args.output)
        raise
