pkg_name=wheel
pkg_version=0.32.3
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A built-package format for Python."
pkg_upstream_url=https://bitbucket.org/pypa/wheel/
pkg_source=https://pypi.org/packages/source/w/wheel/${pkg_dirname}.tar.gz
pkg_shasum=029703bf514e16c8271c3821806a1c171220cc5bdd325cbf4e7da1e056a01db6
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/setuptools
)
pkg_bin_dirs=(bin)
