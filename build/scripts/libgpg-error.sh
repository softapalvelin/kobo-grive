#!/bin/bash
set -e -u
ARCHIVE=libgpg-error-1.9.tar.bz2
ARCHIVEDIR=libgpg-error-1.9
. $KOBO_SCRIPT_DIR/build-common.sh

pushd $ARCHIVEDIR
	./configure --prefix=/usr --host=${CROSSTARGET} --without-debug --without-docbook --without-fexceptions --without-history --without-mem-debug --without-python --without-coverage
	$MAKE -j$MAKE_JOBS
# Checkinstall can help you to collect all changes to one package
#	checkinstall --install=no --nodoc -pakdir ${DEVICEROOT}/.. -y -D $MAKE DESTDIR=/${DEVICEROOT} install
	$MAKE DESTDIR=/${DEVICEROOT} install
popd
markbuilt
