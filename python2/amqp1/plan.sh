pkg_name=amqp1
pkg_distname=amqp
pkg_version=1.4.9
pkg_origin=python2
pkg_license=('BSD-3-Clause' 'LGPL-2.1')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Low-level AMQP client for Python (fork of amqplib)."
pkg_upstream_url=http://github.com/celery/py-amqp
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/a/amqp/${pkg_dirname}.tar.gz
pkg_shasum=2dea4d16d073c902c3b89d9b96620fb6729ac0f7a923bbc777cb4ad827c0c61a
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/coverage
  python2/mock
  python2/nose
  python2/nose-cover3
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
