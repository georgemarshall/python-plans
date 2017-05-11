pkg_name=unittest2
pkg_distname=${pkg_name}
pkg_version=1.1.0
pkg_origin=python2
pkg_license=('Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="The new features in unittest backported to Python 2.4+."
pkg_upstream_url=http://pypi.python.org/pypi/unittest2
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/u/unittest2/${pkg_dirname}.tar.gz
pkg_shasum=22882a0e418c284e1f718a822b3b022944d53d2d908e1690b319a9d3eb2c0579
pkg_deps=(
  python2/python
  python2/argparse
  python2/traceback2
)
pkg_build_deps=(
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
