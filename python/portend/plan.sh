pkg_name=portend
pkg_distname=${pkg_name}
pkg_version=1.8
pkg_origin=python
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="TCP port monitoring utilities"
pkg_upstream_url=https://github.com/jaraco/portend
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/portend/${pkg_dirname}.tar.gz
pkg_shasum=7de919b82c4ac60d4768fe80a2557290661aa665b7c427de6249d8cb2fde5561
pkg_deps=(
  python/python
  python/tempora
)
pkg_build_deps=(
  python/setuptools
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
