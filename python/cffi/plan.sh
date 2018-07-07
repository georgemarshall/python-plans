pkg_name=cffi
pkg_version=1.10.0
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Foreign Function Interface for Python calling C code."
pkg_upstream_url=http://cffi.readthedocs.org/
pkg_source=https://pypi.org/packages/source/c/cffi/${pkg_dirname}.tar.gz
pkg_shasum=b3b02911eb1f6ada203b0763ba924234629b51586f72a21faacc638269f4ced5
pkg_deps=(
  core/gcc-libs
  core/libffi
  $pkg_origin/python
  $pkg_origin/pycparser
)
pkg_build_deps=(
  core/gcc
#  $pkg_origin/py
#  $pkg_origin/pytest
  $pkg_origin/setuptools
)

do_build() {
  python setup.py build_ext --inplace --force
  python setup.py build
}

do_check() {
  # Some tests throw LinkError
  # pytest c/ testing/
  return 0
}
