pkg_name=pastel
pkg_distname=${pkg_name}
pkg_version=0.1.0
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Bring colors to your terminal."
pkg_upstream_url=https://github.com/sdispater/pastel
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pastel/${pkg_dirname}.tar.gz
pkg_shasum=3108af417ec0fa6d0a620e676ec4f02c839ca13e10611586e5d2174b46aa0bc3
pkg_deps=(
  python2/python
)
pkg_build_deps=(
#  python2/pytest
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

# Tests not included in source release
#do_check() {
#  pytest
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
