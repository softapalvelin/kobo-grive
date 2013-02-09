#!/bin/bash
# Original code from https://github.com/kobolabs/Kobo-Reader 

# Exit on subcommand failure or on undefined variable reference
set -e -u

export KOBO_SCRIPT_DIR="`dirname $0`"

while test $# -gt 0; do
	if test "$1" = "clean"; then
		echo "Just delete all files in your build directory to clean"
		exit 0
	else
		echo "Unknown argument $1, exiting"
		exit 1
	fi
done

# Matti Eerola: I changed the modules that are built
for i in \
	libgpg-error \
	libgcrypt \
	json-c \
	curl \
	boost \
	grive \
; do
	if echo "${SKIP:-}" | grep -q \\\<"$i"\\\> ; then
		echo "Building of $i suppressed by \$SKIP"
		continue
	fi
	$KOBO_SCRIPT_DIR/scripts/$i.sh 2>&1 | tee $i.log
	if test "${PIPESTATUS[0]}" -ne 0 ; then
		echo "Build failed at $i.sh, aborting"
		exit 1
	fi
done

echo "All library builds completed successfully"
