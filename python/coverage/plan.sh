pkg_name=coverage
pkg_distname=${pkg_name}
pkg_version=4.4
pkg_origin=python
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Code coverage measurement for Python"
pkg_upstream_url=https://coverage.readthedocs.io
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/coverage/${pkg_dirname}.tar.gz
pkg_shasum=b52e45af6992d6c1b733a54b60fc96a371a5d5d7ef3efa14ad34f884bf1738d6
pkg_deps=(
  python/python
  python/setuptools
)
pkg_build_deps=(
  core/gcc
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

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
