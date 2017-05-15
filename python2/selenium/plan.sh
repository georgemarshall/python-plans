pkg_name=selenium
pkg_distname=${pkg_name}
pkg_version=3.4.1
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python bindings for Selenium"
pkg_upstream_url=https://github.com/SeleniumHQ/selenium/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/s/selenium/${pkg_dirname}.tar.gz
pkg_shasum=ea10cb739d3d2c27dfdd5ed60cdc28a36e6bafb7b6021ac7acd01dfc4aef005b
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
