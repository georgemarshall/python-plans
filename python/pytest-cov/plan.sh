pkg_name=pytest-cov
pkg_version=2.4.0
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Pytest plugin for measuring coverage."
pkg_upstream_url=https://github.com/pytest-dev/pytest-cov
pkg_source=https://pypi.org/packages/source/p/pytest-cov/${pkg_dirname}.tar.gz
pkg_shasum=53d4179086e1eec1c688705977387432c01031b0a7bd91b8ff6c912c08c3820d
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/coverage
  $pkg_origin/py
  $pkg_origin/pytest
)
pkg_build_deps=(
  $pkg_origin/setuptools
)

source ../python-plan-base.sh
