source ../../packages/pytest.sh
source ../default.sh

pkg_deps=(
  ${pkg_base_deps[@]}
  python/py
  python/python
)
pkg_build_deps=(
  ${pkg_base_build_deps[@]}
  python/setuptools
)
