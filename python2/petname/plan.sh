pkg_name=petname
pkg_distname=${pkg_name}
pkg_version=2.2
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Generate human-readable, random object names"
pkg_upstream_url=https://launchpad.net/petname
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/petname/${pkg_dirname}.tar.gz
pkg_shasum=be1da50a6aa01e39840e9a4b79b527a333b256733cb681f52669c08df7819ace
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
