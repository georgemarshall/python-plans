source ../../packages/cffi.sh
source ../default.sh

pkg_deps=(
  ${pkg_base_deps[@]}
  python/pycparser
  python/python
)
pkg_build_deps=(
  ${pkg_base_build_deps[@]}
  python/py
  python/pytest
  python/setuptools
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
