pkg_name=enum34
pkg_distname=${pkg_name}
pkg_version=1.1.6
pkg_origin="${HAB_ORIGIN:-python2}"
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python 3.4 Enum backported to 3.3, 3.2, 3.1, 2.7, 2.6, 2.5, and 2.4"
pkg_upstream_url=https://bitbucket.org/stoneleaf/enum34
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/e/enum34/${pkg_dirname}.tar.gz
pkg_shasum=8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e2df5b1
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
