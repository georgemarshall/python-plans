# add "source ../python-plan-base.sh" below the pkg_name and pkg_version lines, but above everything else
pkg_origin="${HAB_ORIGIN:-python2}"
python_version=2.7
do_setup_environment() {
   push_runtime_env PYTHONPATH "${pkg_prefix}/lib/python${python_version}/site-packages"
}
pkg_deps=( $pkg_origin/python )
pkg_build_deps=( $pkg_origin/setuptools )
