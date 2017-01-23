pkg_name=pycparser
pkg_distname=${pkg_name}
pkg_version=2.17
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pycparser/${pkg_dirname}.tar.gz
pkg_shasum=0aac31e917c24cb3357f5a4d5566f2cc91a19ca41862f6c3c22dc60a629673b6
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="C parser in Python"
pkg_upstream_url=https://github.com/eliben/pycparser
pkg_license=('BSD-3-Clause')
pkg_base_build_deps=(
  core/gcc
)
