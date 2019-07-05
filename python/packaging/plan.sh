pkg_name=packaging
pkg_version=19.0
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('Apache-2.0' 'BSD-2-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Core utilities for Python packages"
pkg_upstream_url=https://github.com/pypa/packaging
pkg_source=https://pypi.org/packages/source/p/packaging/${pkg_dirname}.tar.gz
pkg_shasum=0c98a5d0be38ed775798ece1b9727178c4469d9c3b4ada66e8e6b7849f8732af
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/pyparsing
  $pkg_origin/six
)
