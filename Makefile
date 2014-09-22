outputs := html epub

files := $(wildcard src/*)
markdown := $(shell find src -name "*.md" | sort -t- -k2 -n)
includes := src/includes.html
css := src/pandoc.css
metadata := src/metadata.yml

# basic rules
all: $(outputs)

clean:
	rm -rf build

.PHONY: all clean $(outputs)

define INSTALL_TARGET
$(1): $(2)
	@mkdir -p $$(@D)
	install -m$(3) $$< $$@
endef

$(foreach output, $(outputs), \
	$(eval $(call INSTALL_TARGET, build/$(output)/%, src/%, 644)))

# mathjax rules
MathJax/.git:
	git submodule update --init $(@D)

MathJax: MathJax/.git

# media rules
media = $(wildcard media/*)

$(foreach output, $(outputs), \
	$(eval $(call INSTALL_TARGET, build/$(output)/media/%, media/%, 755)))

$(foreach output, $(outputs), \
	$(eval $(output)_media := $(patsubst media/%, build/$(output)/media/%, $(media))))

# javascript/coffeescript rules
js_source := $(wildcard js-src/*.js)
cs_source := $(wildcard js-src/*.coffee)
javascript := $(patsubst js-src/%, build/js/%, $(js_source)) $(patsubst js-src/%.coffee, build/js/%.js, $(cs_source))

ifeq ($(shell command -v uglifyjs),)
$(eval $(call INSTALL_TARGET, build/js/%.js, js-src/%.js, 644))

build/js/%.js: js-src/%.coffee
	coffee --output $(@D) --compile $<
else
build/js/%.js: js-src/%.js
	@mkdir -p $(@D)
	uglifyjs $< --output $@ --mangle

build/js/%.js: js-src/%.coffee
	@mkdir -p $(@D)
	coffee --print --compile $< | uglifyjs - --output $@ --mangle
endif

$(foreach output, $(outputs), \
	$(eval $(call INSTALL_TARGET, build/$(output)/js/%, build/js/%, 644)))

$(foreach output, $(outputs), \
	$(eval $(output)_js := $(patsubst build/js/%, build/$(output)/js/%, $(javascript))))

# so we don't have to rebuild them for different outputs
.PRECIOUS: build/js/%.js

# html rules
html_files := $(patsubst %.md, %.html, $(patsubst src/%, build/html/%, $(files)))

build/html/%.html: src/%.md src/includes.html
	@mkdir -p $(@D)
	pandoc --write=html5 --output=$@ --smart --standalone --mathjax="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML" --css=pandoc.css --include-in-header=src/includes.html $<
	install -m644 $< build/html

html: $(html_js) $(html_media) $(html_files)

# epub rules
build/epub/intermediate.epub: $(metadata) $(css) $(markdown)
	@mkdir -p $(@D)
	pandoc --write=epub3 --output=$@ --smart --mathml --epub-stylesheet=$(css) $(metadata) $(markdown)

build/epub/output.epub: build/epub/intermediate.epub MathJax $(includes) $(javascript) utils/post-process-epub.py
	python utils/post-process-epub.py --output=$@ --input=$< --include-in-headers=$(includes) --mathjax=MathJax $(javascript)

epub: build/epub/output.epub
