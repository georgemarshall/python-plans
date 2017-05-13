pkg_name=zope-interface
pkg_distname=zope.interface
pkg_version=4.4.0
pkg_origin=python2
pkg_license=('ZPL-2.1')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Interfaces for Python"
pkg_upstream_url=https://github.com/zopefoundation/zope.interface
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/z/zope.interface/${pkg_dirname}.tar.gz
pkg_shasum=e50e5e87cde9bf0ed59229fd372390c2d68b3674ae313858ef544d32051e2cd3
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  core/gcc
  python2/setuptools
  python2/zope-event
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
