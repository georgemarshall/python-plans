pkg_name=cherrypy
pkg_distname=CherryPy
pkg_version=10.2.1
pkg_origin=python
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Object-Oriented HTTP framework"
pkg_upstream_url=http://www.cherrypy.org
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/cherrypy/${pkg_dirname}.tar.gz
pkg_shasum=2ee7e514de0167b63233a6bba25dda2bb9d5ef800da8ea3a0282a9a57a382274
pkg_deps=(
  python/python
  python/cheroot
  python/portend
  python/setuptools
  python/six
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)
pkg_svc_run='cherryd'
pkg_exports=(
  [port]=port
)
pkg_exposes=(port)

do_build() {
  python setup.py build
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
