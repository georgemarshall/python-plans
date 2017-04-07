pkg_name=nose
pkg_distname=${pkg_name}
pkg_version=1.3.7
pkg_origin=python
pkg_license=('LGPL-2.1')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="nose extends unittest to make testing easier"
pkg_upstream_url=http://readthedocs.org/docs/nose/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/n/nose/${pkg_dirname}.tar.gz
pkg_shasum=f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98
pkg_deps=(
  python/python
  python/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

do_begin() {
  add_path_env 'PYTHONPATH' 'lib/python3.6/site-packages'
}

do_build() {
  python setup.py build
}

#do_check() {
#  python setup.py build_tests || python setup.py egg_info; python selftest.py
#}

do_install() {
  python setup.py install \
    --prefix="$pkg_prefix" \
    --old-and-unmanageable # bypass egg install
}

do_strip() {
  do_default_strip

  # Remove tests and bytecode files
  find "$pkg_prefix" -depth \
    \( \
      \( -type d -a -name test -o -name tests \) \
      -o \
      \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
    \) -exec rm -rf '{}' +
}
