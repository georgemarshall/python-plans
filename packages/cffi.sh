pkg_name=cffi
pkg_distname=${pkg_name}
pkg_version=1.9.1
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/cffi/${pkg_dirname}.tar.gz
pkg_shasum=563e0bd53fda03c151573217b3a49b3abad8813de9dd0632e10090f6190fdaf8
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Foreign Function Interface for Python calling C code."
pkg_upstream_url=http://cffi.readthedocs.org/
pkg_license=('MIT')
pkg_base_deps=(
  core/gcc-libs
  core/libffi
)
pkg_base_build_deps=(
  core/gcc
)
