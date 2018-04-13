pkg_name=idna
pkg_distname=${pkg_name}
pkg_version=2.5
pkg_origin="${HAB_ORIGIN:-python2}"
pkg_license=('BSD-4-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Internationalized Domain Names in Applications (IDNA)"
pkg_upstream_url=https://github.com/kjd/idna
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/i/idna/${pkg_dirname}.tar.gz
pkg_shasum=3cb5ce08046c4e3a560fc02f138d0ac63e00f8ce5901a56b32ec8b7994082aab
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

do_check() {
  python setup.py test
}

do_install() {
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
