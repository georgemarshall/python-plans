pkg_name=south
pkg_distname=South
pkg_version=1.0.1
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="South: Migrations for Django"
pkg_upstream_url=http://south.aeracode.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/s/south/${pkg_dirname}.tar.gz
pkg_shasum=1ce97c634107df324eb2fd53cd904d7c04fc8cc6a8fe0800e5f85345b0c75ad3
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
