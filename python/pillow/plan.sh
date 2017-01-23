source ../../packages/pillow.sh
source ../default.sh

pkg_deps=(
  ${pkg_base_deps[@]}
  python/python
)
pkg_build_deps=(
  ${pkg_base_build_deps[@]}
  python/nose
  python/setuptools
)

do_check() {
  python setup.py test
}
