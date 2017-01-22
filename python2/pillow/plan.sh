source ../../packages/pillow.sh
source ../default.sh

pkg_deps=(
  ${pkg_base_deps[@]}
  python2/python
)
pkg_build_deps=(
  ${pkg_base_build_deps[@]}
  python2/pip
  python2/setuptools
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
