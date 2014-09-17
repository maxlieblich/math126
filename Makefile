all: html

clean:
	rm -rf build

outputs := html

files := $(wildcard src/*)

$(patsubst %, build/%/%, $(outputs)): src/%
	install -Dm644 $< $@

# media make targets
media = $(wildcard media/*)

$(patsubst %, build/%/media/%, $(outputs)): media/%
	install -D $< $@

build/%/media: $(patsubst media/%, build/\%/media/%, $(media))
	@mkdir -p $@

.PRECIOUS: $(patsubst %, build/%/media/%, $(outputs))

# javascript/coffeescript make targets
js_source := $(wildcard js-src/*.js)
cs_source := $(wildcard js-src/*.coffee)
javascript := $(patsubst js-src/%, build/js/%, $(js_source)) $(patsubst js-src/%.coffee, build/js/%.js, $(cs_source))

build/js/%: js-src/%
	install -Dm 644 $< $@

build/js/%.js: js-src/%.coffee
	coffee --output $(@D) --compile $<

$(patsubst %, build/%/js/%, $(outputs)): build/js/%
	install -Dm 644 $< $@

build/%/js: $(patsubst build/%, build/\%/%, $(javascript))
	@mkdir -p $@

.PRECIOUS: build/js/% build/js/%.js $(patsubst %, build/%/js/%, $(outputs))

# html build targets
html_files := $(patsubst %.md, %.html, $(patsubst src/%, build/html/%, $(files)))

build/html/%.html: src/%.md src/includes.html
	@mkdir -p $(@D)
	pandoc -w html5 -o $@ --smart --standalone --mathjax --css=pandoc.css --include-in-header=src/includes.html $<

html: build/html/js build/html/media $(html_files)

.PHONY: all clean html
