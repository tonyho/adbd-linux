all: adb/adbd adbd.service

libcutils/libcutils.a: libcutils/*.c libcutils/*.cpp
	make -C libcutils

base/libbase.a: base/*.cpp
	make -C base

libcrypto_utils/libcrypto_utils.a: libcrypto_utils/android_pubkey.c
	make -C libcrypto_utils

adb/adbd adb/xdg-adbd: libcutils/libcutils.a base/libbase.a libcrypto_utils/libcrypto_utils.a adb/*.cpp adb/xdg-adbd.c
	make -C adb

clean:
	make -C libcutils clean
	make -C base clean
	make -C libcrypto_utils clean
	make -C adb clean

install: all
	install -d -m 0755 $(DESTDIR)/$(PREFIX)/sbin
	install -D -m 0755 adb/adbd $(DESTDIR)/$(PREFIX)/sbin/
	install -D -m 0755 adb/xdg-adbd $(DESTDIR)/$(PREFIX)/sbin/
	install -d -m 0755 $(DESTDIR)/$(PREFIX)/lib/systemd/system/
	install -D -m 0755 adbd.service $(DESTDIR)/$(PREFIX)/lib/systemd/system/
