pkg_name=cherrypy
source ../python/${pkg_name}/plan.sh
source ../python-plan-base.sh
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/cheroot
  $pkg_origin/portend
  $pkg_origin/setuptools
  $pkg_origin/six
)
