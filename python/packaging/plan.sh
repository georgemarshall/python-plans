pkg_name=packaging
pkg_version=17.1
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('Apache-2.0' 'BSD-2-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Core utilities for Python packages"
pkg_upstream_url=https://github.com/pypa/packaging
pkg_source=https://pypi.org/packages/source/p/packaging/${pkg_dirname}.tar.gz
pkg_shasum=f019b770dd64e585a99714f1fd5e01c7a8f11b45635aa953fd41c689a657375b
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/pyparsing
  $pkg_origin/six
)
