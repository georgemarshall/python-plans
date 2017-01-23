source ../../packages/wheel.sh
source ../default.sh

pkg_deps=(
  ${pkg_base_deps[@]}
  python2/python
  python2/setuptools
)
pkg_build_deps=(
  ${pkg_base_build_deps[@]}
  python2/coverage
  python2/jsonschema
  python2/py
  python2/pytest
  python2/pytest-cov
)

do_check() {
  python setup.py test
}
