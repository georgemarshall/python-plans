pkg_name=pbr
pkg_distname=${pkg_name}
pkg_version=3.0.0
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python Build Reasonableness"
pkg_upstream_url=http://docs.openstack.org/developer/pbr/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pbr/${pkg_dirname}.tar.gz
pkg_shasum=568f988af109114fbfa0525dcb6836b069838360d11732736ecc82e4c15d5c12
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
