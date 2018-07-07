pkg_name=pillow
source ../python/${pkg_name}/plan.sh
source ../python-plan-base.sh
pkg_deps=(
  $pkg_origin/python
  core/freetype
  core/lcms2
  core/libjpeg-turbo
  core/libtiff
  core/libwebp
  core/openjpeg
  core/zlib
  $pkg_origin/olefile
  $pkg_origin/setuptools
)
pkg_build_deps=(
  core/gcc
  $pkg_origin/nose
)
