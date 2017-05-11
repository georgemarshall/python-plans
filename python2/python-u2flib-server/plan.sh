pkg_name=python-u2flib-server
pkg_distname=${pkg_name}
pkg_version=5.0.0
pkg_origin=python2
pkg_license=('BSD-2-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python based U2F server library"
pkg_upstream_url=https://github.com/Yubico/python-u2flib-server
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/python-u2flib-server/${pkg_dirname}.tar.gz
pkg_shasum=9b9044db13fe24abc7a07c2bdb4b7bb541ca275702f43ecbd0d9641c28bcc226
pkg_deps=(
  python2/python
  python2/cryptography
  python2/enum34
  python2/six
)
pkg_build_deps=(
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
