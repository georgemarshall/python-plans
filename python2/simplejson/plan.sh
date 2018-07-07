pkg_name=simplejson
source ../python/${pkg_name}/plan.sh
source ../python-plan-base.sh
pkg_build_deps=(
  core/gcc
  $pkg_origin/setuptools
)
