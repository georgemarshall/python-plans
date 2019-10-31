pkg_name=cython
pkg_version=0.25.2
source ../python-plan-base.sh
pkg_distname=Cython
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="The Cython compiler for writing C extensions for the Python \
language."
pkg_upstream_url=http://cython.org/
pkg_source=https://pypi.org/packages/source/c/cython/${pkg_dirname}.tar.gz
pkg_shasum=f141d1f9c27a07b5a93f7dc5339472067e2d7140d1c5a9e20112a5665ca60306
pkg_deps=(
  core/gcc
  $pkg_origin/python
)
pkg_build_deps=(
  core/gdb
  core/make
)
pkg_bin_dirs=(bin)
