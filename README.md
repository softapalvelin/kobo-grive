kobo-grive
==========

Build grive for Kobo firmware.

Build system and scripts are copied from https://github.com/kobolabs/Kobo-Reader

I modified build-all.sh to include only grive and its dependencies. 

If code from kobolabs is installed in folder ~/kobo/koboreader/ then you should install this code to folder ~/kobo/kobo-grive/.

You should use build scripts almost the same way you use builds scripts from kobolabs. Create directory ~/kobo/tmp/ and then create script (for example "build-kobo-grive.sh") that executes:
export ac_cv_func_malloc_0_nonnull=yes
export ac_cv_func_realloc_0_nonnull=yes
/home/[USERNAME]/kobo/kobo-grive/build/build-all.sh

I got link errors without malloc and realloc nonnull lines so you might need them too.

Before building you should create some setting files to build directory. Just copy files from build/*.template and remove the ".template" from the file name. Then enter settings that work for you environment.

The changes that I needed for building grive are in grive-arm-build.diff file. The changes are also included in the packages/grive-dev.tar.bz2.

