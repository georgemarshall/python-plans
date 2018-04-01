pkg_name=nose
pkg_distname=${pkg_name}
pkg_version=1.3.7
pkg_origin="${HAB_ORIGIN:-python2}"
pkg_license=('LGPL-2.1')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="nose extends unittest to make testing easier"
pkg_upstream_url=http://readthedocs.org/docs/nose/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/n/nose/${pkg_dirname}.tar.gz
pkg_shasum=f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
do_setup_environment() {
   push_buildtime_env PYTHONPATH "${pkg_prefix}/lib/python2.7/site-packages"
   push_runtime_env PYTHONPATH "${pkg_prefix}/lib/python2.7/site-packages"
}
pkg_bin_dirs=(bin)

do_build() {
  python setup.py build
}

do_check() {
  python setup.py build_tests || python setup.py egg_info; python selftest.py
}

do_install() {
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
