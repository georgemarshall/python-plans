pkg_name=backpack
pkg_distname=${pkg_name}
pkg_version=0.1
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Useful utilities for Python."
pkg_upstream_url=https://github.com/sdispater/backpack
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/b/backpack/${pkg_dirname}.tar.gz
pkg_shasum=0162cf7b34c810ba4ddbbd32a1e5e804ef96fcf2fea5ce2848aa4950770d3893
pkg_deps=(
  python2/python
  python2/simplejson
)
pkg_build_deps=(
  python2/cython
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
#  pytest tests
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
