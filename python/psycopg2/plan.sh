pkg_name=psycopg2
pkg_distname=${pkg_name}
pkg_version=2.7.1
pkg_origin=python
pkg_license=('LGPL-3.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python-PostgreSQL Database Adapter"
pkg_upstream_url=http://initd.org/psycopg/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/psycopg2/${pkg_dirname}.tar.gz
pkg_shasum=86c9355f5374b008c8479bc00023b295c07d508f7c3b91dbd2e74f8925b1d9c6
pkg_deps=(
  core/postgresql
  python/python
)
pkg_build_deps=(
  core/gcc
  core/make
  python/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

do_check() {
  # Sadly the test suite does not work with python3
  # python setup.py test
  return 0
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
