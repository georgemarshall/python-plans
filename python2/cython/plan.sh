pkg_name=cython
source ../../python/${pkg_name}/plan.sh
source ../python-plan-base.sh
pkg_deps=(
  core/gcc
  $pkg_origin/python
)
pkg_build_deps=(
  core/gdb
  core/make
)
