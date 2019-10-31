pkg_name=lxml
pkg_version=3.7.3
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Pythonic XML processing library combining libxml2/libxslt \
with the ElementTree API."
pkg_upstream_url=http://lxml.de/
pkg_source=https://pypi.org/packages/source/l/lxml/${pkg_dirname}.tar.gz
pkg_shasum=aa502d78a51ee7d127b4824ff96500f0181d3c7826e6ee7b800d068be79361c7
pkg_deps=(
  core/gcc-libs
  core/libxml2
  core/libxslt
  $pkg_origin/python
)
pkg_build_deps=(
  $pkg_origin/cython
  $pkg_origin/setuptools
)

do_check() {
  python setup.py test
}
