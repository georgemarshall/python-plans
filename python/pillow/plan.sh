source ../../packages/pillow.sh
source ../default.sh

pkg_deps=(
  ${pkg_base_deps[@]}
  python/python
)
pkg_build_deps=(
  ${pkg_base_build_deps[@]}
  python/pip
  python/setuptools
)

do_check() {
  pip install nose
  python setup.py test
}

do_end(){
  if [[ -n "$DO_CHECK" ]]; then
    pip uninstall --yes nose
  fi
}
