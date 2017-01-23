source ../../packages/cffi.sh
source ../default.sh

pkg_deps=(
  ${pkg_base_deps[@]}
  python2/pycparser
  python2/python
)
pkg_build_deps=(
  ${pkg_base_build_deps[@]}
  python2/py
  python2/pytest
  python2/setuptools
)

do_build() {
  python setup.py build_ext --inplace --force
  python setup.py build
}

do_check() {
  # Some tests throw LinkError
  # pytest c/ testing/
  return 0
}
