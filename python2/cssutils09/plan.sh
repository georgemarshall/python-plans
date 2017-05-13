pkg_name=cssutils09
pkg_distname=cssutils
pkg_version=0.9.10
pkg_origin=python2
pkg_license=('LGPL-3.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A CSS Cascading Style Sheets library for Python"
pkg_upstream_url=http://cthedot.de/cssutils/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/cssutils/${pkg_dirname}.zip
pkg_shasum=2ea142fddf8aec9231fde5bc1184b282008f2ca35a7b483371eef5b97b6c23a6
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
