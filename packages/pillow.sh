pkg_name=pillow
pkg_distname=Pillow
pkg_version=4.0.0
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pillow/${pkg_dirname}.tar.gz
pkg_shasum=ee26d2d7e7e300f76ba7b796014c04011394d0c4a5ed9a288264a3e443abca50
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python Imaging Library (Fork)"
pkg_upstream_url=https://python-pillow.org/
pkg_license=('Standard PIL License')
pkg_base_deps=(
  core/freetype
  core/lcms2
  core/libjpeg-turbo
  core/libtiff
  core/libwebp
  core/openjpeg
  core/zlib
)
pkg_base_build_deps=(
  core/gcc
)
pkg_bin_dirs=(bin)
