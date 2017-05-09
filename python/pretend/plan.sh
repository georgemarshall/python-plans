pkg_name=pretend
pkg_distname=${pkg_name}
pkg_version=1.0.8
pkg_origin=python
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A library for stubbing in Python"
pkg_upstream_url=https://github.com/alex/pretend
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pretend/${pkg_dirname}.tar.gz
pkg_shasum=930f2c1e18503e8f8c403abe2e02166c4a881941745147e712cdd4f49f3fb964
pkg_deps=(
  python/python
)
pkg_build_deps=(
  python/setuptools
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
