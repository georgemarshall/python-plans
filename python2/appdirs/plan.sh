pkg_name=appdirs
pkg_distname=${pkg_name}
pkg_version=1.4.3
pkg_origin="${HAB_ORIGIN:-python2}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description='A small Python module for determining appropriate \
platform-specific dirs, e.g. a "user data dir".'
pkg_upstream_url=https://github.com/ActiveState/appdirs
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/a/appdirs/${pkg_dirname}.tar.gz
pkg_shasum=9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b372d92
pkg_deps=(
  $pkg_origin/python
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
    --no-compile
}
