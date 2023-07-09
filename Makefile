
PREFIX = /usr/local

trb: trb.sh trb.awk trb.tsv
	cat trb.sh > $@
	echo 'exit 0' >> $@
	echo "#EOF" >> $@
	tar czf - trb.awk trb.tsv >> $@
	chmod +x $@

test: trb.sh
	shellcheck -s sh trb.sh

clean:
	rm -f trb

install: trb
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f trb $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/trb

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/trb

.PHONY: test clean install uninstall
