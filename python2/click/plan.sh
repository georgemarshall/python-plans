pkg_name=click
pkg_distname=${pkg_name}
pkg_version=6.7
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A simple wrapper around optparse for powerful command line \
utilities."
pkg_upstream_url=http://github.com/mitsuhiko/click
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/click/${pkg_dirname}.tar.gz
pkg_shasum=f15516df478d5a56180fbf80e68f206010e6d160fc39fa508b65e035fd75130b
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/pytest
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

do_check() {
  export PYTHONPATH="$PWD/build/lib:$PYTHONPATH"
  pytest tests
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
