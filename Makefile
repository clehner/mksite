mds := $(patsubst %.md,%.html,$(wildcard *.md))
contents := $(patsubst %.content.html,%.html,$(wildcard *.content.html))

all: $(mds) $(contents)

%.content.html: %.md
	md2html.awk $< > $@

%.html: %.content.html _template_nav.html
	sed _template_nav.html > $@\
		-e 's/{title}/$*/g'\
		-e '/{content}/r $<'\
		-e '/{content}/d'

_template_nav.html: _template.html _nav.html
	sed $< > $@\
		-e '/{link}/r _nav.html'\
		-e '/{link}/d'\

_nav.html: _nav
	sed -n 's/.*/$(shell sed -ne 's/\//\\\//g' -e 's/{link}/\\0/pg' _template.html)/pg' _nav > $@

_nav:
	ls | sed -n 's/^\(.*\)\.\(md\|content\.html\)$$/\1/p' > $@

clean:
	rm _nav _nav.html _template_nav.html $(mds) $(contents)
