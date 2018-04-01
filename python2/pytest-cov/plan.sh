pkg_name=pytest-cov
pkg_distname=${pkg_name}
pkg_version=2.4.0
pkg_origin="${HAB_ORIGIN:-python2}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Pytest plugin for measuring coverage."
pkg_upstream_url=https://github.com/pytest-dev/pytest-cov
pkg_dirname=${pkg_distname}-${pkg_version}
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
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
do_setup_environment() {
   push_buildtime_env PYTHONPATH "${pkg_prefix}/lib/python2.7/site-packages"
   push_runtime_env PYTHONPATH "${pkg_prefix}/lib/python2.7/site-packages"
}

do_build() {
  python setup.py build
}

do_install() {
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
