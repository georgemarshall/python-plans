pkg_name=zope-event
pkg_distname=zope.event
pkg_version=4.2.0
pkg_origin=python2
pkg_license=('ZPL-2.1')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="IPv4/IPv6 manipulation library"
pkg_upstream_url=http://pypi.python.org/pypi/zope.event
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/z/zope.event/${pkg_dirname}.tar.gz
pkg_shasum=ce11004217863a4827ea1a67a31730bddab9073832bdb3b9be85869259118758
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
