pkg_name=idna
pkg_version=2.5
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('BSD-4-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Internationalized Domain Names in Applications (IDNA)"
pkg_upstream_url=https://github.com/kjd/idna
pkg_source=https://pypi.org/packages/source/i/idna/${pkg_dirname}.tar.gz
pkg_shasum=3cb5ce08046c4e3a560fc02f138d0ac63e00f8ce5901a56b32ec8b7994082aab
pkg_deps=( $pkg_origin/python )
pkg_build_deps=( $pkg_origin/setuptools )

do_check() {
  python setup.py test
}
