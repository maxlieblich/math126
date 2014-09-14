all: html

clean:
	rm -rf build

files := $(wildcard lectures/*/*)

# TODO: figure out how to merge these into fewer targes
build/js/%: js/%
	install -D $< $@
build/js/%: bower_components/dat-gui/build/%
	install -D $< $@
build/js/%: bower_components/three.js/build/%
	install -D $< $@

build/html/%: lectures/%
	install -D $< $@

build/html/pandoc.css: pandoc.css
	install -D $< $@

# javascript/coffeescript make targets
js_source := $(wildcard js/*.js) $(patsubst %, js/%, $(notdir $(wildcard bower_components/*/build/*.min.js)))
cs_source := $(wildcard js/*.coffee)
javascript := $(patsubst %, build/%, $(js_source)) $(patsubst %.coffee, build/%.js, $(cs_source))

build/js/%.js: js/%.coffee
	coffee --output $(@D) --compile $<

build/js: $(javascript)

build/%/js: build/js
	@mkdir -p $(@D)
	cp -rf $< $@

# html build targets
html_files := $(patsubst %.md, %.html, $(patsubst lectures/%, build/html/%, $(files)))

build/html/%/lecture.html: lectures/%/lecture.md includes.html
	@mkdir -p $(@D)
	pandoc -w html5 -o $@ --standalone --smart --mathjax --include-in-header=includes.html $<

html: build/html/js build/html/pandoc.css $(html_files)

.PHONY: all html
