pkg_name=django
pkg_distname=Django
pkg_version=1.11.1
pkg_origin="${HAB_ORIGIN:-python2}"
pkg_license=('BSD')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A high-level Python Web framework that encourages rapid \
development and clean, pragmatic design."
pkg_upstream_url=https://www.djangoproject.com/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/d/django/${pkg_dirname}.tar.gz
pkg_shasum=bbcefdf822eeef2cd04718ebcc24dd2ecf47407258cfcde2b4f95df57ce33a8c
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/pytz
  $pkg_origin/setuptools
)
do_setup_environment() {
   push_buildtime_env PYTHONPATH "${pkg_prefix}/lib/python2.7/site-packages"
   push_runtime_env PYTHONPATH "${pkg_prefix}/lib/python2.7/site-packages"
}
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

do_build() {
  python setup.py build
}

do_install() {
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
