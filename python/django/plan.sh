pkg_name=django
pkg_version=1.11.1
source ../python-plan-base.sh
pkg_distname=Django
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('BSD')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A high-level Python Web framework that encourages rapid \
development and clean, pragmatic design."
pkg_upstream_url=https://www.djangoproject.com/
pkg_source=https://pypi.org/packages/source/d/django/${pkg_dirname}.tar.gz
pkg_shasum=bbcefdf822eeef2cd04718ebcc24dd2ecf47407258cfcde2b4f95df57ce33a8c
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/pytz
  $pkg_origin/setuptools
)
pkg_bin_dirs=(bin)
