pkg_name=cherrypy
pkg_version=10.2.1
source ../python-plan-base.sh
pkg_distname=CherryPy
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Object-Oriented HTTP framework"
pkg_upstream_url=http://www.cherrypy.org
pkg_source=https://pypi.org/packages/source/c/cherrypy/${pkg_dirname}.tar.gz
pkg_shasum=2ee7e514de0167b63233a6bba25dda2bb9d5ef800da8ea3a0282a9a57a382274
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/cheroot
  $pkg_origin/portend
  $pkg_origin/setuptools
  $pkg_origin/six
)

pkg_bin_dirs=(bin)
pkg_svc_run='cherryd'
pkg_exports=(
  [port]=port
)
pkg_exposes=(port)
