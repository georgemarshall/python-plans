pkg_name=pyparsing
pkg_version=2.3.0
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A Python Parsing Module"
pkg_upstream_url=https://pyparsing.wikispaces.com/
pkg_source=https://pypi.org/packages/source/p/pyparsing/${pkg_dirname}.tar.gz
pkg_shasum=f353aab21fd474459d97b709e527b5571314ee5f067441dc9f88e33eecd96592
pkg_deps=( $pkg_origin/python )
