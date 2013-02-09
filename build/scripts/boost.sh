#!/bin/bash
set -e -u
ARCHIVE=boost_1_52_0.tar.bz2
ARCHIVEDIR=boost_1_52_0
. $KOBO_SCRIPT_DIR/build-common.sh
cp -f $KOBO_SCRIPT_DIR/user-config.jam $ARCHIVEDIR/tools/build/v2/user-config.jam

pushd $ARCHIVEDIR
	./bootstrap.sh --prefix=${DEVICEROOT}/usr --with-libraries=program_options,filesystem
	./b2 toolset=gcc-arm install
popd
markbuilt
