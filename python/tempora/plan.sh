pkg_name=tempora
pkg_version=1.6.1
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Objects and routines pertaining to date and time (tempora)"
pkg_upstream_url=https://github.com/jaraco/tempora
pkg_source=https://pypi.org/packages/source/t/tempora/${pkg_dirname}.tar.gz
pkg_shasum=1c15b3ec37933192470e7e7f0dcd5fbb372a85f13c86ddb4c306f280a7fc1453
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/pytz
  $pkg_origin/setuptools
  $pkg_origin/six
)
pkg_bin_dirs=(bin)

source ../python-plan-base.sh
