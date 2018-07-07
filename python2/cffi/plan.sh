pkg_name=cffi
source ../python/${pkg_name}/plan.sh
source ../python-plan-base.sh
pkg_deps=(
  core/gcc-libs
  core/libffi
  $pkg_origin/python
  $pkg_origin/pycparser
)
pkg_build_deps=(
  core/gcc
  $pkg_origin/setuptools
)
