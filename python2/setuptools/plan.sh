pkg_name=setuptools
pkg_distname=${pkg_name}
pkg_version=39.2.0
pkg_origin="${HAB_ORIGIN:-python2}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Easily download, build, install, upgrade, and uninstall \
Python packages"
pkg_upstream_url=https://github.com/pypa/setuptools
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/s/setuptools/${pkg_dirname}.zip
pkg_shasum=f7cddbb5f5c640311eb00eab6e849f7701fa70bf6a183fc8a2c33dd1d1672fb2
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/appdirs
  $pkg_origin/packaging
  $pkg_origin/six
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
