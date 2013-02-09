#!/bin/bash
set -e -u
ARCHIVE=grive-dev.tar.bz2
ARCHIVEDIR=grive
. $KOBO_SCRIPT_DIR/build-common.sh

pushd $ARCHIVEDIR
# libgcrypt needed some hacking
	$CMAKE -DCMAKE_TOOLCHAIN_FILE=$KOBO_SCRIPT_DIR/build-config-user.cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DLIBGCRYPT_LIBRARIES=${DEVICEROOT}/usr/lib/libgcrypt.so -DLIBGCRYPT_CFLAGS=" " -DLIBGCRYPT_FOUND=1 .
	$MAKE -j$MAKE_JOBS
# Checkinstall can help you to collect all changes to one package
#	checkinstall --install=no --nodoc -pakdir ${DEVICEROOT}/.. -y -D $MAKE DESTDIR=/${DEVICEROOT} install
	$MAKE DESTDIR=/${DEVICEROOT} install
popd
markbuilt
