pkg_name=packaging
source ../python/${pkg_name}/plan.sh
source ../python-plan-base.sh
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/pyparsing
  $pkg_origin/six
)
