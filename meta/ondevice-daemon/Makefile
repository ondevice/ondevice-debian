
all:
	echo '~~ nothing to do ~~' >&2

install:
	mkdir -p $(DESTDIR)/usr/lib/ondevice/
	install -o root -g root -m 0755 ./ondevice-daemon.sh $(DESTDIR)/usr/lib/ondevice/ondevice-daemon.sh
	install -o root -g rooy -m 0644 logrotate.conf $(DESTDIR)/etc/logrotate.d/ondevice-daemon
