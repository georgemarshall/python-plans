pkg_name=nose
pkg_version=1.3.7
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('LGPL-2.1')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="nose extends unittest to make testing easier"
pkg_upstream_url=http://readthedocs.org/docs/nose/
pkg_source=https://pypi.org/packages/source/n/nose/${pkg_dirname}.tar.gz
pkg_shasum=f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/setuptools
)
pkg_bin_dirs=(bin)

do_check() {
  # python setup.py build_tests || python setup.py egg_info; python selftest.py
  return 0
}
