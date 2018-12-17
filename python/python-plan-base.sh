# add "source ../python-plan-base.sh" below the pkg_name and pkg_version lines, but above everything else
pkg_distname=${pkg_name}
pkg_dirname=${pkg_distname}-${pkg_version}
python_version=3.6
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
do_setup_environment() {
   push_runtime_env PYTHONPATH "${pkg_prefix}/lib/python${python_version}/site-packages"
}

do_prepare() {
  mkdir -p "${pkg_prefix}/lib/python${python_version}/site-packages"
}

do_build() {
  python setup.py build
}

do_install() {
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile
}

