pkg_name=uwsgi
source ../../python/${pkg_name}/plan.sh
source ../python-plan-base.sh
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

do_after() {
  patchelf --set-rpath "$(pkg_path_for python2/python)/lib:$(pkg_path_for core/pcre)/lib" "$pkg_prefix/bin/uwsgi"
}
