source ../../packages/pytest-cov.sh
source ../default.sh

pkg_deps=(
  ${pkg_base_deps[@]}
  python2/coverage
  python2/py
  python2/pytest
  python2/python
)
pkg_build_deps=(
  ${pkg_base_build_deps[@]}
  python2/setuptools
)
