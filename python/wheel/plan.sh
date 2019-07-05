pkg_name=wheel
pkg_version=0.33.4
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A built-package format for Python."
pkg_upstream_url=https://bitbucket.org/pypa/wheel/
pkg_source=https://pypi.org/packages/source/w/wheel/${pkg_dirname}.tar.gz
pkg_shasum=62fcfa03d45b5b722539ccbc07b190e4bfff4bb9e3a4d470dd9f6a0981002565
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/setuptools
)
pkg_bin_dirs=(bin)
