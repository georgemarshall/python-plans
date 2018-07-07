pkg_name=wheel
pkg_version=0.31.1
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A built-package format for Python."
pkg_upstream_url=https://bitbucket.org/pypa/wheel/
pkg_source=https://pypi.org/packages/source/w/wheel/${pkg_dirname}.tar.gz
pkg_shasum=0a2e54558a0628f2145d2fc822137e322412115173e8a2ddbe1c9024338ae83c
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/setuptools
)
pkg_bin_dirs=(bin)
