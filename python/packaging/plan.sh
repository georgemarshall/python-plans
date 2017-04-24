pkg_name=packaging
pkg_distname=${pkg_name}
pkg_version=16.8
pkg_origin=python
pkg_license=('Apache-2.0' 'BSD-2-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Core utilities for Python packages"
pkg_upstream_url=https://github.com/pypa/packaging
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/packaging/${pkg_dirname}.tar.gz
pkg_shasum=5d50835fdf0a7edf0b55e311b7c887786504efea1177abd7e69329a8e5ea619e
pkg_deps=(
  python/python
  python/pyparsing
  python/six
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
    --no-compile
}
