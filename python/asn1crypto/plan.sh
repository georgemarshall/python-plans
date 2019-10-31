pkg_name=asn1crypto
pkg_version=0.22.0
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python ASN.1 library with a focus on performance and a \
pythonic API"
pkg_upstream_url=https://github.com/wbond/asn1crypto
pkg_source=https://pypi.org/packages/source/a/asn1crypto/${pkg_dirname}.tar.gz
pkg_shasum=cbbadd640d3165ab24b06ef25d1dca09a3441611ac15f6a6b452474fdf0aed1a
pkg_deps=( $pkg_origin/python )
pkg_build_deps=( $pkg_origin/setuptools)
