pkg_name=setuptools
source ../python/${pkg_name}/plan.sh
source ../python-plan-base.sh
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/appdirs
  $pkg_origin/packaging
  $pkg_origin/six
)
pkg_build_deps=()
