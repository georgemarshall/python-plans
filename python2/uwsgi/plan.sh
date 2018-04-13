pkg_name=uwsgi
pkg_distname=${pkg_name}
pkg_version=2.0.15
pkg_origin="${HAB_ORIGIN:-python2}"
pkg_license=('GPL-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="The uWSGI server"
pkg_upstream_url=http://projects.unbit.it/uwsgi
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/u/uwsgi/${pkg_dirname}.tar.gz
pkg_shasum=572ef9696b97595b4f44f6198fe8c06e6f4e6351d930d22e5330b071391272ff
pkg_deps=(
  core/pcre
  $pkg_origin/setuptools
  $pkg_origin/gevent
)
pkg_build_deps=(
  core/gcc
  core/patchelf
  $pkg_origin/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)
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

do_after() {
  patchelf --set-rpath "$(pkg_path_for python2/python)/lib:$(pkg_path_for core/pcre)/lib" "$pkg_prefix/bin/uwsgi"
}
