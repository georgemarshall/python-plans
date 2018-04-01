pkg_name=psycopg2
pkg_distname=${pkg_name}
pkg_version=2.7.1
pkg_origin="${HAB_ORIGIN:-python2}"
pkg_license=('LGPL-3.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python-PostgreSQL Database Adapter"
pkg_upstream_url=http://initd.org/psycopg/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/psycopg2/${pkg_dirname}.tar.gz
pkg_shasum=86c9355f5374b008c8479bc00023b295c07d508f7c3b91dbd2e74f8925b1d9c6
pkg_deps=(
  core/postgresql
  $pkg_origin/python
)
pkg_build_deps=(
  core/gcc
  core/make
  $pkg_origin/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
do_setup_environment() {
   push_buildtime_env PYTHONPATH "${pkg_prefix}/lib/python2.7/site-packages"
   push_runtime_env PYTHONPATH "${pkg_prefix}/lib/python2.7/site-packages"
}

do_build() {
  python setup.py build
}

do_check() {
  python setup.py test
}

do_install() {
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
