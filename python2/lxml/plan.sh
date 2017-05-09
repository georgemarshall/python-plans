pkg_name=lxml
pkg_distname=${pkg_name}
pkg_version=3.7.3
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Pythonic XML processing library combining libxml2/libxslt \
with the ElementTree API."
pkg_upstream_url=http://lxml.de/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/l/lxml/${pkg_dirname}.tar.gz
pkg_shasum=aa502d78a51ee7d127b4824ff96500f0181d3c7826e6ee7b800d068be79361c7
pkg_deps=(
  core/gcc-libs
  core/libxml2
  core/libxslt
  python2/python
)
pkg_build_deps=(
  python2/cython
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

do_check() {
  python setup.py test
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
