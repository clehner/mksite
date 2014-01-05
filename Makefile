# For making the example site:

#include $(shell which mksite)
include mksite

md2html = ./md2html.awk

index_name = About

deploy: all
	rsync -avz . me@example.org:/srv/www/

# For installing mksite:

# paths
PREFIX = /usr/local
P = ${DESTDIR}${PREFIX}

link:
	mkdir -p ${P}/bin
	ln -f -s ${PWD}/mksite ${P}/bin
	ln -f -s ${PWD}/md2html.awk ${P}/bin

install:
	mkdir -p ${P}/bin
	cp -f mksite ${P}/bin
	chmod 755 ${P}/bin/mksite
	cp -f md2html.awk ${P}/bin
	chmod 755 ${P}/bin/md2html.awk

uninstall:
	rm -f ${P}/bin/mksite
	rm -f ${P}/bin/md2html.awk

.PHONY: install uninstall link
