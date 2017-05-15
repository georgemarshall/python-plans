pkg_name=percy
pkg_distname=${pkg_name}
pkg_version=0.4.5
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python client library for visual regression testing with \
Percy (https://percy.io)."
pkg_upstream_url=https://github.com/percy/python-percy-client
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/percy/${pkg_dirname}.tar.gz
pkg_shasum=02b41f074b7bfcdff3bad7fc62d5a70b35da23b34e611d327ac8fe2aa2d6c64b
pkg_deps=(
  python2/python
  python2/requests
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
