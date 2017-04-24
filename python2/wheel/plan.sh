pkg_name=wheel
pkg_distname=${pkg_name}
pkg_version=0.29.0
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A built-package format for Python."
pkg_upstream_url=https://bitbucket.org/pypa/wheel/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/w/wheel/${pkg_dirname}.tar.gz
pkg_shasum=1ebb8ad7e26b448e9caa4773d2357849bf80ff9e313964bcaf79cbf0201a1648
pkg_deps=(
  python2/python
  python2/setuptools
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
