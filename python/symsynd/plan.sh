pkg_name=symsynd
pkg_version=3.0.0
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Helps symbolicating crash dumps."
pkg_upstream_url=http://github.com/getsentry/symsynd
pkg_source=https://pypi.org/packages/source/s/symsynd/${pkg_dirname}.zip
pkg_shasum=796a7960dcf1e39cb192e9de4070b782d7777164758767f096c8c8fa20b445e4
pkg_deps=(
  core/gcc-libs
  core/libffi
  $pkg_origin/python
)
pkg_build_deps=(
  core/cmake
  core/gcc
  core/make
  core/patch
  core/rust
  $pkg_origin/cffi
  $pkg_origin/setuptools
)

do_setup_environment() {
   push_runtime_env PYTHONPATH "${pkg_prefix}/lib/python${python_version}/site-packages"
   push_buildtime_env CC "$(pkg_path_for gcc)/bin/gcc"
   push_buildtime_env CXX "$(pkg_path_for gcc)/bin/g++"
}

do_prepare() {
  patch -p0 -i "$PLAN_CONTEXT/buildsh.patch"
}

