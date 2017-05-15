pkg_name=extras
pkg_distname=${pkg_name}
pkg_version=1.0.0
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Useful extra bits for Python - things that should be in the \
standard library"
pkg_upstream_url=https://github.com/testing-cabal/extras
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/e/extras/${pkg_dirname}.tar.gz
pkg_shasum=132e36de10b9c91d5d4cc620160a476e0468a88f16c9431817a6729611a81b4e
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
