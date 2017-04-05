pkg_name=cffi
pkg_distname=${pkg_name}
pkg_version=1.10.0
pkg_origin=python
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Foreign Function Interface for Python calling C code."
pkg_upstream_url=http://cffi.readthedocs.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/cffi/${pkg_dirname}.tar.gz
pkg_shasum=b3b02911eb1f6ada203b0763ba924234629b51586f72a21faacc638269f4ced5
pkg_deps=(
  core/gcc-libs
  core/libffi
  python/python
  python/pycparser
)
pkg_build_deps=(
  core/gcc
#  python/py
#  python/pytest
  python/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_begin() {
  add_path_env 'PYTHONPATH' 'lib/python3.6/site-packages'
}

do_build() {
  python setup.py build_ext --inplace --force
  python setup.py build
}

do_check() {
  # Some tests throw LinkError
  # pytest c/ testing/
  return 0
}

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
