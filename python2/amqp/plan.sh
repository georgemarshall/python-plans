pkg_name=amqp
pkg_distname=${pkg_name}
pkg_version=2.1.4
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Low-level AMQP client for Python (fork of amqplib)."
pkg_upstream_url=http://github.com/celery/py-amqp
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/a/amqp/${pkg_dirname}.tar.gz
pkg_shasum=1378cc14afeb6c2850404f322d03dec0082d11d04bdcb0360e1b10d4e6e77ef9
pkg_deps=(
  python2/python
  python2/vine
)
pkg_build_deps=(
  python2/case
  python2/pytest
  python2/setuptools
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
