
all:
	echo '~~ nothing to do ~~' >&2

install:
	mkdir -p $(DESTDIR)/usr/lib/ondevice/
	install -o root -g root -m 0755 ./ondevice-daemon.sh $(DESTDIR)/usr/lib/ondevice/ondevice-daemon.sh
	mkdir -p $(DESTDIR)/etc/logrotate.d/
	install -o root -g root -m 0644 logrotate.conf $(DESTDIR)/etc/logrotate.d/ondevice-daemon
