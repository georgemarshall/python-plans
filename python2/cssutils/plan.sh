pkg_name=cssutils
pkg_distname=${pkg_name}
pkg_version=1.0.2
pkg_origin=python2
pkg_license=('LGPL-3.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A CSS Cascading Style Sheets library for Python"
pkg_upstream_url=http://cthedot.de/cssutils/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/cssutils/${pkg_dirname}.tar.gz
pkg_shasum=a2fcf06467553038e98fea9cfe36af2bf14063eb147a70958cfcaa8f5786acaf
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
