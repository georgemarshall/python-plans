pkg_name=jsonschema
pkg_version=2.6.0
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="An implementation of JSON Schema validation for Python"
pkg_upstream_url=http://github.com/Julian/jsonschema
pkg_source=https://pypi.org/packages/source/j/jsonschema/${pkg_dirname}.tar.gz
pkg_shasum=6ff5f3180870836cae40f06fa10419f557208175f13ad7bc26caa77beb1f6e02
pkg_deps=(
  $pkg_origin/python
)
pkg_build_deps=(
  $pkg_origin/setuptools
)
