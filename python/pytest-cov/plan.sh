source ../../packages/pytest-cov.sh
source ../default.sh

pkg_deps=(
  ${pkg_base_deps[@]}
  python/coverage
  python/py
  python/pytest
  python/python
)
pkg_build_deps=(
  ${pkg_base_build_deps[@]}
  python/setuptools
)
