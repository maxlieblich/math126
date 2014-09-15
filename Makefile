all: html

clean:
	rm -rf build

files := $(wildcard src/*) $(wildcard media/*)

# javascript/coffeescript make targets
js_source := $(wildcard js-src/*.js)
cs_source := $(wildcard js-src/*.coffee)
javascript := $(patsubst js-src/%, build/js/%, $(js_source)) $(patsubst js-src/%.coffee, build/js/%.js, $(cs_source))

build/js/%: js-src/%
	install -D $< $@
build/html/%: src/%
	install -D $< $@
build/html/media/%: media/%
	install -D $< $@

build/js/%.js: js-src/%.coffee
	coffee --output $(@D) --compile $<

build/js: $(javascript)
	mkdir -p $@

build/%/js: build/js
	@mkdir -p $@
	cp -rf build/js/* $@/

# html build targets
html_files := $(patsubst %.md, %.html, $(patsubst media/%, build/html/media/%, $(patsubst src/%, build/html/%, $(files))))

build/html/%.html: src/%.md src/includes.html
	@mkdir -p $(@D)
	pandoc -w html5 -o $@ --smart --standalone --mathjax --css=pandoc.css --include-in-header=src/includes.html $<

html: build/html/js $(html_files)

.PHONY: all clean html
