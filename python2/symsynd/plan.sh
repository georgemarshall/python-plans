pkg_name=symsynd
source ../python/${pkg_name}/plan.sh
source ../python-plan-base.sh
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
