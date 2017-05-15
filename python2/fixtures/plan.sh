pkg_name=fixtures
pkg_distname=${pkg_name}
pkg_version=3.0.0
pkg_origin=python2
pkg_license=('Apache-2.0' 'BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Fixtures, reusable state for writing clean tests and more."
pkg_upstream_url=https://launchpad.net/python-fixtures
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/f/fixtures/${pkg_dirname}.tar.gz
pkg_shasum=fcf0d60234f1544da717a9738325812de1f42c2fa085e2d9252d8fff5712b2ef
pkg_deps=(
  python2/python
  python2/six
)
pkg_build_deps=(
  python2/pbr
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
