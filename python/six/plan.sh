pkg_name=six
pkg_version=1.11.0
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python 2 and 3 compatibility utilities"
pkg_upstream_url=https://github.com/benjaminp/six
pkg_source=https://pypi.org/packages/source/s/six/${pkg_dirname}.tar.gz
pkg_shasum=70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9
pkg_deps=( $pkg_origin/python )
