pkg_name=hiredis
pkg_distname=${pkg_name}
pkg_version=0.2.0
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python wrapper for hiredis"
pkg_upstream_url=https://github.com/redis/hiredis-py
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/h/hiredis/${pkg_dirname}.tar.gz
pkg_shasum=ca958e13128e49674aa4a96f02746f5de5973f39b57297b84d59fd44d314d5b5
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  core/gcc
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
