pkg_name=psycopg2
source ../python/${pkg_name}/plan.sh
source ../python-plan-base.sh
pkg_deps=(
  core/postgresql-client
  $pkg_origin/python
)
pkg_build_deps=(
  core/gcc
  core/make
  $pkg_origin/setuptools
)
