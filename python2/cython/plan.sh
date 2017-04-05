pkg_name=cython
pkg_distname=Cython
pkg_version=0.25.2
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="The Cython compiler for writing C extensions for the Python \
language."
pkg_upstream_url=http://cython.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/cython/${pkg_dirname}.tar.gz
pkg_shasum=f141d1f9c27a07b5a93f7dc5339472067e2d7140d1c5a9e20112a5665ca60306
pkg_deps=(
  core/gcc
  python2/python
)
pkg_build_deps=(
  core/gdb
  core/make
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

do_begin() {
  add_path_env 'PYTHONPATH' 'lib/python2.7/site-packages'
}

do_build() {
  python setup.py build
}

#do_check() {
#  python runtests.py
#}

do_install() {
  python setup.py install \
    --prefix="$pkg_prefix"
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
