pkg_name=lxml
source ../../python/${pkg_name}/plan.sh
source ../python-plan-base.sh
pkg_deps=(
  core/gcc-libs
  core/libxml2
  core/libxslt
  $pkg_origin/python
)
pkg_build_deps=(
  $pkg_origin/cython
  $pkg_origin/setuptools
)
