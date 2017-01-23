pkg_name=uwsgi
pkg_distname=${pkg_name}
pkg_version=2.0.14
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/u/uwsgi/${pkg_dirname}.tar.gz
pkg_shasum=21b3d1ef926d835ff23576193a2c60d4c896d8e21567850cf0677a4764122887
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="The uWSGI server"
pkg_upstream_url=http://projects.unbit.it/uwsgi
pkg_license=('GPL-2.0')
pkg_base_build_deps=(
  core/gcc
)
pkg_bin_dirs=(bin)
