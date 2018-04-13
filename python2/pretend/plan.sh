pkg_name=pretend
pkg_distname=${pkg_name}
pkg_version=1.0.8
pkg_origin="${HAB_ORIGIN:-python2}"
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A library for stubbing in Python"
pkg_upstream_url=https://github.com/alex/pretend
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pretend/${pkg_dirname}.tar.gz
pkg_shasum=930f2c1e18503e8f8c403abe2e02166c4a881941745147e712cdd4f49f3fb964
pkg_deps=(
  $pkg_origin/python
)
pkg_build_deps=(
  $pkg_origin/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
do_setup_environment() {
   push_buildtime_env PYTHONPATH "${pkg_prefix}/lib/python2.7/site-packages"
   push_runtime_env PYTHONPATH "${pkg_prefix}/lib/python2.7/site-packages"
}

do_build() {
  python setup.py build
}

do_install() {
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
