pkg_name=docutils
pkg_distname=${pkg_name}
pkg_version=0.13.1
pkg_origin=python2
pkg_license=('BSD-2-Clause' 'GPL-3.0' 'Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="IPv4/IPv6 manipulation library"
pkg_upstream_url=http://docutils.sourceforge.net/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/d/docutils/${pkg_dirname}.tar.gz
pkg_shasum=718c0f5fb677be0f34b781e04241c4067cbd9327b66bdd8e763201130f5175be
pkg_deps=(
  python2/python
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
    --no-compile
}
