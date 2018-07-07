pkg_name=portend
pkg_version=1.8
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="TCP port monitoring utilities"
pkg_upstream_url=https://github.com/jaraco/portend
pkg_source=https://pypi.org/packages/source/p/portend/${pkg_dirname}.tar.gz
pkg_shasum=7de919b82c4ac60d4768fe80a2557290661aa665b7c427de6249d8cb2fde5561
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/tempora
)
pkg_build_deps=(
  $pkg_origin/setuptools
)
