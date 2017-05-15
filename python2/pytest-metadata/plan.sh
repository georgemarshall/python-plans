pkg_name=pytest-metadata
pkg_distname=${pkg_name}
pkg_version=1.4.0
pkg_origin=python2
pkg_license=('MPL-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="pytest plugin for test session metadata"
pkg_upstream_url=https://github.com/davehunt/pytest-metadata
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pytest-metadata/${pkg_dirname}.tar.gz
pkg_shasum=2f65a39f4f87e024cb864458978080c360a0c3dd170718d020df178d0d851be6
pkg_deps=(
  python2/python
  python2/pytest
)
pkg_build_deps=(
  python2/setuptools
  python2/setuptools-scm
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
