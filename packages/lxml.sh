pkg_name=lxml
pkg_distname=${pkg_name}
pkg_version=3.7.2
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/l/lxml/${pkg_dirname}.tar.gz
pkg_shasum=59d9176360dbc3919e9d4bfca85c1ca64ab4f4ee00e6f119d7150ba887e3410a
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Pythonic XML processing library combining libxml2/libxslt with the ElementTree API."
pkg_upstream_url=http://lxml.de/
pkg_license=('BSD-3-Clause')
pkg_base_deps=(
  core/gcc-libs
  core/libxml2
  core/libxslt
)
pkg_base_build_deps=(
  core/gcc
)
