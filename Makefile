VERSION = 2.40
DESTDIR =
PREFIX = /usr
PACKAGE = glibc-sinitic-langpacks

build:

install:
	install -d $(DESTDIR)$(PREFIX)/lib/locale
	localedef -f UTF-8 -i cmn_TW.def --no-archive $(DESTDIR)$(PREFIX)/lib/locale/cmn_TW
	localedef -f UTF-8 -i nan_TW.def --no-archive $(DESTDIR)$(PREFIX)/lib/locale/nan_TW
	localedef -f UTF-8 -i nan_TW@latin.def --no-archive $(DESTDIR)$(PREFIX)/lib/locale/nan_TW@latin
	localedef -f UTF-8 -i hak_TW.def --no-archive $(DESTDIR)$(PREFIX)/lib/locale/hak_TW
	localedef -f UTF-8 -i lzh_TW.def --no-archive $(DESTDIR)$(PREFIX)/lib/locale/lzh_TW
	localedef -f UTF-8 -i yue_TW.def --no-archive $(DESTDIR)$(PREFIX)/lib/locale/yue_TW
	localedef -f UTF-8 -i yue_HK.def --no-archive $(DESTDIR)$(PREFIX)/lib/locale/yue_HK
	localedef -f UTF-8 -i cmn.def --no-archive $(DESTDIR)$(PREFIX)/lib/locale/cmn
	localedef -f UTF-8 -i nan.def --no-archive $(DESTDIR)$(PREFIX)/lib/locale/nan
	localedef -f UTF-8 -i hak.def --no-archive $(DESTDIR)$(PREFIX)/lib/locale/hak
	localedef -f UTF-8 -i lzh.def --no-archive $(DESTDIR)$(PREFIX)/lib/locale/lzh
	localedef -f UTF-8 -i yue.def --no-archive $(DESTDIR)$(PREFIX)/lib/locale/yue

uninstall:
	rm -rf $(DESTDIR)$(PREFIX)/lib/locale/cmn_TW
	rm -rf $(DESTDIR)$(PREFIX)/lib/locale/nan_TW
	rm -rf $(DESTDIR)$(PREFIX)/lib/locale/nan_TW@latin
	rm -rf $(DESTDIR)$(PREFIX)/lib/locale/hak_TW
	rm -rf $(DESTDIR)$(PREFIX)/lib/locale/lzh_TW
	rm -rf $(DESTDIR)$(PREFIX)/lib/locale/yue_TW
	rm -rf $(DESTDIR)$(PREFIX)/lib/locale/yue_HK
	rm -rf $(DESTDIR)$(PREFIX)/lib/locale/cmn
	rm -rf $(DESTDIR)$(PREFIX)/lib/locale/nan
	rm -rf $(DESTDIR)$(PREFIX)/lib/locale/hak
	rm -rf $(DESTDIR)$(PREFIX)/lib/locale/lzh
	rm -rf $(DESTDIR)$(PREFIX)/lib/locale/yue

clean:

rpm: $(PACKAGE).spec
	rsync -aC --delete . $(HOME)/rpmbuild/SOURCES/$(PACKAGE)-$(VERSION)
	tar czf $(HOME)/rpmbuild/SOURCES/$(PACKAGE)-$(VERSION).tar.gz -C $(HOME)/rpmbuild/SOURCES $(PACKAGE)-$(VERSION)
	rpmbuild -ta $(HOME)/rpmbuild/SOURCES/$(PACKAGE)-$(VERSION).tar.gz
