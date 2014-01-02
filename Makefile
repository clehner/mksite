bin = mksite
md2html = md2html.awk

# paths
PREFIX = /usr/local

all:

install:
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f ${bin} ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/${bin}
	cp -f ${md2html} ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/${md2html}

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/${bin}
	rm -f ${DESTDIR}${PREFIX}/bin/${md2html}

.PHONY: install uninstall
