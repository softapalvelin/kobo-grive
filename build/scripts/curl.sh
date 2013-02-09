#!/bin/bash
set -e -u
ARCHIVE=curl-7.28.1.tar.bz2
ARCHIVEDIR=curl-7.28.1
. $KOBO_SCRIPT_DIR/build-common.sh

pushd $ARCHIVEDIR
        CPPFLAGS="${CPPFLAGS} -I${DEVICEROOT}/usr/include/openssl" LDFLAGS="${LDFLAGS} -L${DEVICEROOT}/usr/lib -R${DEVICEROOT}/usr/lib" ./configure --prefix=/usr --host=${CROSSTARGET} --with-ssl --without-debug --without-docbook --without-fexceptions --without-history --without-mem-debug --without-python --without-coverage
	$MAKE -j$MAKE_JOBS
# Checkinstall can help you to collect all changes to one package
#	checkinstall --install=no --nodoc -pakdir ${DEVICEROOT}/.. -y -D $MAKE DESTDIR=/${DEVICEROOT} install
	$MAKE DESTDIR=/${DEVICEROOT} install
popd
markbuilt
