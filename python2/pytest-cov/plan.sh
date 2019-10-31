pkg_name=pytest-cov
source ../../python/${pkg_name}/plan.sh
source ../python-plan-base.sh
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/coverage
  $pkg_origin/py
  $pkg_origin/pytest
)
