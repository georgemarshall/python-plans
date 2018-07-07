pkg_name=pillow
pkg_distname=Pillow
pkg_version=4.1.1
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('Standard PIL License')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python Imaging Library (Fork)"
pkg_upstream_url=https://python-pillow.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pillow/${pkg_dirname}.tar.gz
pkg_shasum=00b6a5f28d00f720235a937ebc2f50f4292a5c7e2d6ab9a8b26153b625c4f431
pkg_deps=(
  core/freetype
  core/lcms2
  core/libjpeg-turbo
  core/libtiff
  core/libwebp
  core/openjpeg
  core/zlib
  $pkg_origin/python
  $pkg_origin/olefile
  $pkg_origin/setuptools
)
pkg_build_deps=(
  core/gcc
  $pkg_origin/nose
)
do_setup_environment() {
   push_runtime_env PYTHONPATH "${pkg_prefix}/lib/python2.7/site-packages"
}
pkg_bin_dirs=(bin)

do_build() {
  python setup.py build
}

do_check() {
  python setup.py test
}

do_install() {
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
