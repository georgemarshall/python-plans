pkg_name=pytest
pkg_version=3.0.7
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Simple powerful testing with Python"
pkg_upstream_url=http://pytest.org/
pkg_source=https://pypi.org/packages/source/p/pytest/${pkg_dirname}.tar.gz
pkg_shasum=b70696ebd1a5e6b627e7e3ac1365a4bc60aaf3495e843c1e70448966c5224cab
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/py
  $pkg_origin/setuptools
)
pkg_bin_dirs=(bin)

source ../python-plan-base.sh
