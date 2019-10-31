pkg_name=libsourcemap
pkg_version=0.6.0
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('BSD')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Helps working with sourcemaps."
pkg_upstream_url=https://github.com/getsentry/libsourcemap
pkg_source=https://pypi.org/packages/source/l/libsourcemap/${pkg_dirname}.zip
pkg_shasum=61583d165ed0fc6548501a4495ea6e4f925cabf8a7a8916ef679963813f074ff
pkg_deps=(
  core/gcc-libs
  $pkg_origin/python
)
pkg_build_deps=(
  core/gcc
  core/llvm
  core/make
  core/rust
  $pkg_origin/cffi
  $pkg_origin/setuptools
)
do_setup_environment() {
   push_runtime_env PYTHONPATH "${pkg_prefix}/lib/python2.7/site-packages"
   push_buildtime_env CC "$(pkg_path_for gcc)/bin/gcc"
   push_buildtime_env CXX "$(pkg_path_for gcc)/bin/g++"
}
