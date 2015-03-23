all: adb/adbd

libcutils/libcutils.a: libcutils/*.c libcutils/*.cpp
	pushd libcutils ; make ; popd

base/libbase.a: base/*.cpp
	pushd base ; make ; popd

adb/adbd: libcutils/libcutils.a base/libbase.a adb/*.cpp
	pushd adb ; make ; popd

clean:
	pushd libcutils ; make clean ; popd
	pushd adb ; make clean ; popd
	rm -f adb/adbd libcutils/libcutils.a base/libbase.a

install: FIXME
