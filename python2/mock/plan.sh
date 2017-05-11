pkg_name=mock
pkg_distname=${pkg_name}
pkg_version=2.0.0
pkg_origin=python2
pkg_license=('BSD-2-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Rolling backport of unittest.mock for all Pythons"
pkg_upstream_url=https://github.com/testing-cabal/mock
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/m/mock/${pkg_dirname}.tar.gz
pkg_shasum=b158b6df76edd239b8208d481dc46b6afd45a846b7812ff0ce58971cf5bc8bba
pkg_deps=(
  python2/python
  python2/funcsigs
)
pkg_build_deps=(
  python2/pbr
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
  unit2 discover
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
