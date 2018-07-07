pkg_name=iso8601
pkg_version=0.1.11
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Simple module to parse ISO 8601 dates"
pkg_upstream_url=https://bitbucket.org/micktwomey/pyiso8601
pkg_source=https://pypi.org/packages/source/i/iso8601/${pkg_dirname}.tar.gz
pkg_shasum=e8fb52f78880ae063336c94eb5b87b181e6a0cc33a6c008511bac9a6e980ef30
pkg_deps=(
  $pkg_origin/python
)
pkg_build_deps=(
  $pkg_origin/setuptools
)
