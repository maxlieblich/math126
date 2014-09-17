outputs := html

files := $(wildcard src/*)
markdown := $(shell find src -name "*.md" | sort -t- -k2 -n)

# basic maketargets

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

# media make targets
media = $(wildcard media/*)

$(foreach output, $(outputs), \
	$(eval $(call INSTALL_TARGET, build/$(output)/media/%, media/%, 755)))

$(foreach output, $(outputs), \
	$(eval $(output)_media := $(patsubst media/%, build/$(output)/media/%, $(media))))

# javascript/coffeescript make targets
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

# html build targets
html_files := $(patsubst %.md, %.html, $(patsubst src/%, build/html/%, $(files)))

build/html/%.html: src/%.md src/includes.html
	@mkdir -p $(@D)
	pandoc --write=html5 --output=$@ --smart --standalone --mathjax --css=pandoc.css --include-in-header=src/includes.html $<

html: $(html_js) $(html_media) $(html_files)
