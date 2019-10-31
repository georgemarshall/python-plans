pkg_name=cheroot
pkg_version=5.4.0
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Highly-optimized, pure-python HTTP server"
pkg_upstream_url=https://github.com/cherrypy/cheroot
pkg_source=https://pypi.org/packages/source/c/cheroot/${pkg_dirname}.tar.gz
pkg_shasum=f4b3d2eaa949b8a2f6676e3bca7c68cd358e4aa6bab437362b4bee6781626135
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/six
)
pkg_build_deps=(
  $pkg_origin/setuptools
)
