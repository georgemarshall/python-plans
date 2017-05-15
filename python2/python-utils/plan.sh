pkg_name=python-utils
pkg_distname=${pkg_name}
pkg_version=2.1.0
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python Utils is a module with some convenient utilities not \
included with the standard Python install"
pkg_upstream_url=https://github.com/WoLpH/python-utils
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/python-utils/${pkg_dirname}.tar.gz
pkg_shasum=1709f793d4445ddb13d26a4ec74662676fd3d534ebce97c5519e5455b0f19ad5
pkg_deps=(
  python2/python
  python2/six
)
pkg_build_deps=(
#  python2/pytest
  python2/pytest-runner
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

# Tests not included in source release
#do_check() {
#  python setup.py test
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
