pkg_name=sqlparse
pkg_distname=${pkg_name}
pkg_version=0.2.3
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Non-validating SQL parser"
pkg_upstream_url=https://github.com/andialbrecht/sqlparse
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/s/sqlparse/${pkg_dirname}.tar.gz
pkg_shasum=becd7cc7cebbdf311de8ceedfcf2bd2403297024418801947f8c953025beeff8
pkg_deps=(
  python2/python
  python2/setuptools
)
pkg_build_deps=(
  python2/pytest
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

do_build() {
  python setup.py build
}

do_check() {
  pytest
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
