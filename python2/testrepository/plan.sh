pkg_name=testrepository
pkg_distname=${pkg_name}
pkg_version=0.0.20
pkg_origin=python2
pkg_license=('Apache-2.0' 'BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A repository of test results."
pkg_upstream_url=https://launchpad.net/testrepository
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/t/testrepository/${pkg_dirname}.tar.gz
pkg_shasum=752449bc98c20253ec4611c40564aea93d435a5bf3ff672208e01cc10e5858eb
pkg_deps=(
  python2/python
  python2/fixtures
  python2/python-subunit
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
