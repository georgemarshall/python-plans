pkg_name=cssselect
pkg_distname=${pkg_name}
pkg_version=1.0.1
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="cssselect parses CSS3 Selectors and translates them to XPath 1.0"
pkg_upstream_url=https://github.com/scrapy/cssselect
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/cssselect/${pkg_dirname}.tar.gz
pkg_shasum=73db1c054b9348409e2862fc6c0dde5c4e4fbe4da64c5c5a9e05fbea45744077
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
