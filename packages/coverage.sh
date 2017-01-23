pkg_name=coverage
pkg_distname=${pkg_name}
pkg_version=4.3.4
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/coverage/${pkg_dirname}.tar.gz
pkg_shasum=eaaefe0f6aa33de5a65f48dd0040d7fe08cac9ac6c35a56d0a7db109c3e733df
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Code coverage measurement for Python"
pkg_upstream_url=https://coverage.readthedocs.io
pkg_license=('Apache-2.0')
pkg_base_build_deps=(
  core/gcc
)
pkg_bin_dirs=(bin)
