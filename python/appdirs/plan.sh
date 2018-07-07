pkg_name=appdirs
pkg_version=1.4.3
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description='A small Python module for determining appropriate \
platform-specific dirs, e.g. a "user data dir".'
pkg_upstream_url=https://github.com/ActiveState/appdirs
pkg_source=https://pypi.org/packages/source/a/appdirs/${pkg_dirname}.tar.gz
pkg_shasum=9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b372d92
pkg_deps=( $pkg_origin/python )
