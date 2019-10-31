pkg_name=coverage
pkg_version=4.4
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Code coverage measurement for Python"
pkg_upstream_url=https://coverage.readthedocs.io
pkg_source=https://pypi.org/packages/source/c/coverage/${pkg_dirname}.tar.gz
pkg_shasum=b52e45af6992d6c1b733a54b60fc96a371a5d5d7ef3efa14ad34f884bf1738d6
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/setuptools
)
pkg_build_deps=(
  core/gcc
)
pkg_bin_dirs=(bin)
