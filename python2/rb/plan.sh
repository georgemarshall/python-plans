pkg_name=rb
pkg_distname=${pkg_name}
pkg_version=1.6
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="rb, the redis blaster"
pkg_upstream_url=https://github.com/getsentry/rb
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/r/rb/${pkg_dirname}.tar.gz
pkg_shasum=a4fc394a578b0bf5d68b84e9722b43f9e88ea1f7262f06e82e68a3e4a53914db
pkg_deps=(
  python2/python
  python2/redis
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
