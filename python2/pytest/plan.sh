pkg_name=pytest
pkg_distname=${pkg_name}
pkg_version=3.0.7
pkg_origin="${HAB_ORIGIN:-python2}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Simple powerful testing with Python"
pkg_upstream_url=http://pytest.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pytest/${pkg_dirname}.tar.gz
pkg_shasum=b70696ebd1a5e6b627e7e3ac1365a4bc60aaf3495e843c1e70448966c5224cab
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/py
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
