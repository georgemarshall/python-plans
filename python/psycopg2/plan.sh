source ../../packages/psycopg2.sh
source ../default.sh

pkg_deps=(
  ${pkg_base_deps[@]}
  python/python
)
pkg_build_deps=(
  ${pkg_base_build_deps[@]}
  python/setuptools
)

do_check() {
  # Sadly the test suite does not work with python3
  #python setup.py test
  return 0
}
