#!/bin/bash
set -e -u
ARCHIVE=libgcrypt-1.5.0.tar.bz2
ARCHIVEDIR=libgcrypt-1.5.0
. $KOBO_SCRIPT_DIR/build-common.sh

pushd $ARCHIVEDIR
	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}" ./configure --prefix=/usr --host=${CROSSTARGET} --with-gpg-error-prefix=${DEVICEROOT}/usr
	$MAKE -j$MAKE_JOBS
# Checkinstall can help you to collect all changes to one package
#	checkinstall --install=no --nodoc -pakdir ${DEVICEROOT}/.. -y -D $MAKE DESTDIR=/${DEVICEROOT} install
	$MAKE DESTDIR=/${DEVICEROOT} install
popd
markbuilt
