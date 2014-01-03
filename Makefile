# For making the example site
#include $(shell which mksite)
include mksite

# For installing mksite:

bin = mksite
md2html = md2html.awk

# paths
PREFIX = /usr/local
P = ${DESTDIR}${PREFIX}

deploy: all
	rsync -avz . me@example.org:/srv/www/

link:
	mkdir -p ${P}/bin
	ln -f -s ${PWD}/${bin} ${P}/bin
	ln -f -s ${PWD}/${md2html} ${P}/bin

install:
	mkdir -p ${P}/bin
	cp -f ${bin} ${P}/bin
	chmod 755 ${P}/bin/${bin}
	cp -f ${md2html} ${P}/bin
	chmod 755 ${P}/bin/${md2html}

uninstall:
	rm -f ${P}/bin/${bin}
	rm -f ${P}/bin/${md2html}

.PHONY: install uninstall
