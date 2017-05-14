pkg_name=kombu3
pkg_distname=kombu
pkg_version=3.0.37
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Messaging library for Python."
pkg_upstream_url=https://kombu.readthedocs.io/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/k/kombu/${pkg_dirname}.tar.gz
pkg_shasum=e064a00c66b4d1058cd2b0523fb8d98c82c18450244177b6c0f7913016642650
pkg_deps=(
  python2/python
  python2/amqp1
  python2/anyjson
)
pkg_build_deps=(
  python2/nose
  python2/mock
  python2/redis
  python2/setuptools
  python2/unittest2
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

do_check() {
  python setup.py test
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
