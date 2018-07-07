pkg_name=pyparsing
pkg_version=2.2.0
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A Python Parsing Module"
pkg_upstream_url=https://pyparsing.wikispaces.com/
pkg_source=https://pypi.org/packages/source/p/pyparsing/${pkg_dirname}.tar.gz
pkg_shasum=0832bcf47acd283788593e7a0f542407bd9550a55a8a8435214a1960e04bcb04
pkg_deps=( $pkg_origin/python )
