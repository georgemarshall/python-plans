pkg_name=pytest
pkg_distname=${pkg_name}
pkg_version=3.0.7
pkg_origin=python
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Simple powerful testing with Python"
pkg_upstream_url=http://pytest.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pytest/${pkg_dirname}.tar.gz
pkg_shasum=b70696ebd1a5e6b627e7e3ac1365a4bc60aaf3495e843c1e70448966c5224cab
pkg_deps=(
  python/python
  python/py
  python/setuptools
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
