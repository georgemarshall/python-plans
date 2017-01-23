source ../../packages/wheel.sh
source ../default.sh

pkg_deps=(
  ${pkg_base_deps[@]}
  python/python
  python/setuptools
)
pkg_build_deps=(
  ${pkg_base_build_deps[@]}
  python/coverage
  python/jsonschema
  python/py
  python/pytest
  python/pytest-cov
)

do_check() {
  python setup.py test
}
