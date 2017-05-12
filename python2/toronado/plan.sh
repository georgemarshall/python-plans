pkg_name=toronado
pkg_distname=${pkg_name}
pkg_version=0.0.11
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Fast lxml-based CSS stylesheet inliner."
pkg_upstream_url=https://github.com/disqus/toronado
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/t/toronado/${pkg_dirname}.tar.gz
pkg_shasum=7985dc9a13c969fa1372d600455a86709fb6a124dca58c759b6b42e892ddb0a8
pkg_deps=(
  python2/python
  python2/cssselect
  python2/cssutils
  python2/lxml
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
