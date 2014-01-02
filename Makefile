bin = mksite

# paths
PREFIX = /usr/local

all:

install:
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f ${bin} ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/${bin}

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/${bin}

.PHONY: install uninstall
