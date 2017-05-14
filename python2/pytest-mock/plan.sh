pkg_name=pytest-mock
pkg_distname=${pkg_name}
pkg_version=1.6.0
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Thin-wrapper around the mock package for easier use with py.test"
pkg_upstream_url=https://github.com/pytest-dev/pytest-mock/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pytest-mock/${pkg_dirname}.tar.gz
pkg_shasum=83a17cbcd4dbc7c6c9dc885a0d598f9acd11f2d5142e0718ed32e14538670c1f
pkg_deps=(
  python2/python
  python2/mock
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

# Tests are broken :(
#do_check() {
#  pytest test_pytest_mock.py
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
