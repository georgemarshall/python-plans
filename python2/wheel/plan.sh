pkg_name=wheel
pkg_distname=${pkg_name}
pkg_version=0.30.0
pkg_origin="${HAB_ORIGIN:-python2}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A built-package format for Python."
pkg_upstream_url=https://bitbucket.org/pypa/wheel/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/w/wheel/${pkg_dirname}.tar.gz
pkg_shasum=9515fe0a94e823fd90b08d22de45d7bde57c90edce705b22f5e1ecf7e1b653c8
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/setuptools
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
