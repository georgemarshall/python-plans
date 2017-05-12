pkg_name=mock10
pkg_distname=mock
pkg_version=1.0.1
pkg_origin=python2
pkg_license=('BSD-2-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Rolling backport of unittest.mock for all Pythons"
pkg_upstream_url=https://github.com/testing-cabal/mock
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/m/mock/${pkg_dirname}.tar.gz
pkg_shasum=b839dd2d9c117c701430c149956918a423a9863b48b09c90e30a6013e7d2f44f
pkg_deps=(
  python2/python
  python2/pbr
  python2/funcsigs
)
pkg_build_deps=(
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
