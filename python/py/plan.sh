pkg_name=py
pkg_version=1.4.33
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Library with cross-python path, ini-parsing, io, code, log \
facilities."
pkg_upstream_url=http://pylib.readthedocs.org/
pkg_source=https://pypi.org/packages/source/p/py/${pkg_dirname}.tar.gz
pkg_shasum=1f9a981438f2acc20470b301a07a496375641f902320f70e31916fe3377385a9
pkg_deps=( $pkg_origin/python )
pkg_build_deps=( $pkg_origin/setuptools )
