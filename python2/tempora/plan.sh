pkg_name=tempora
pkg_distname=${pkg_name}
pkg_version=1.6.1
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Objects and routines pertaining to date and time (tempora)"
pkg_upstream_url=https://github.com/jaraco/tempora
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/t/tempora/${pkg_dirname}.tar.gz
pkg_shasum=1c15b3ec37933192470e7e7f0dcd5fbb372a85f13c86ddb4c306f280a7fc1453
pkg_deps=(
  python2/python
  python2/pytz
  python2/setuptools
  python2/six
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
