pkg_name=tempora
source ../../python/${pkg_name}/plan.sh
source ../python-plan-base.sh
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/pytz
  $pkg_origin/six
)
