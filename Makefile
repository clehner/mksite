bin = mksite

# paths
PREFIX = /usr/local

all:

link:
	@echo linking executable file into ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@ln -f -s ${PWD}/${bin} ${DESTDIR}${PREFIX}/bin

install:
	@echo installing executable file to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp -f ${bin} ${DESTDIR}${PREFIX}/bin
	@chmod 755 ${DESTDIR}${PREFIX}/bin/${bin}

uninstall:
	@echo removing executable file from ${DESTDIR}${PREFIX}/bin
	@rm -f ${DESTDIR}${PREFIX}/bin/${bin}

.PHONY: install uninstall
