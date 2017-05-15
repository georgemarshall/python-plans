pkg_name=httplib2
pkg_distname=${pkg_name}
pkg_version=0.10.3
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A comprehensive HTTP client library."
pkg_upstream_url=https://github.com/httplib2/httplib2
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/h/httplib2/${pkg_dirname}.tar.gz
pkg_shasum=e404d3b7bd86c1bc931906098e7c1305d6a3a6dcef141b8bb1059903abb3ceeb
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
