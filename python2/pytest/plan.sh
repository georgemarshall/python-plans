pkg_name=pytest
source ../python/${pkg_name}/plan.sh
source ../python-plan-base.sh
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/py
  $pkg_origin/setuptools
)
