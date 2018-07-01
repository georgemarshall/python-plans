pkg_name=pip
pkg_distname=${pkg_name}
pkg_version=10.0.1
pkg_origin="${HAB_ORIGIN:-python2}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="The PyPA recommended tool for installing Python packages."
pkg_upstream_url=https://pip.pypa.io/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pip/${pkg_dirname}.tar.gz
pkg_shasum=f2bd08e0cd1b06e10218feaf6fef299f473ba706582eb3bd9d52203fdbd7ee68
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/setuptools
  $pkg_origin/wheel
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
do_setup_environment() {
   push_buildtime_env PYTHONPATH "${pkg_prefix}/lib/python2.7/site-packages"
   push_runtime_env PYTHONPATH "${pkg_prefix}/lib/python2.7/site-packages"
}
pkg_bin_dirs=(bin)

do_build() {
  python setup.py build
}

do_install() {
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
