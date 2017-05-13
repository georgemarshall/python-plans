pkg_name=constantly
pkg_distname=${pkg_name}
pkg_version=15.1.0
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Symbolic constants in Python"
pkg_upstream_url=https://github.com/twisted/constantly
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/constantly/${pkg_dirname}.tar.gz
pkg_shasum=586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba59146dfc35
pkg_deps=(
  python2/python
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

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
