pkg_name=python-subunit
pkg_distname=${pkg_name}
pkg_version=1.2.0
pkg_origin=python2
pkg_license=('Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python implementation of subunit test streaming protocol"
pkg_upstream_url=http://launchpad.net/subunit
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/python-subunit/${pkg_dirname}.tar.gz
pkg_shasum=fde9a22587c01766ef30721a38e2f1cd1c09af0f52e538b41a62983ffa1331fa
pkg_deps=(
  python2/python
  python2/extras
  python2/setuptools
  python2/testtools
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
