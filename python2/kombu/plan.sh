pkg_name=kombu
pkg_distname=${pkg_name}
pkg_version=4.0.2
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Messaging library for Python."
pkg_upstream_url=https://kombu.readthedocs.io/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/k/kombu/${pkg_dirname}.tar.gz
pkg_shasum=d0fc6f2a36610a308f838db4b832dad79a681b516ac1d1a1f9d42edb58cc11a2
pkg_deps=(
  python2/python
  python2/amqp
)
pkg_build_deps=(
  python2/case
  python2/pytest
  python2/pytz
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
