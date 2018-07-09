pkg_name=libsourcemap
source ../../python/${pkg_name}/plan.sh
source ../python-plan-base.sh
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
