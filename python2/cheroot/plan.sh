pkg_name=cheroot
pkg_distname=${pkg_name}
pkg_version=5.4.0
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Highly-optimized, pure-python HTTP server"
pkg_upstream_url=https://github.com/cherrypy/cheroot
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/cheroot/${pkg_dirname}.tar.gz
pkg_shasum=f4b3d2eaa949b8a2f6676e3bca7c68cd358e4aa6bab437362b4bee6781626135
pkg_deps=(
  python2/python
  python2/six
)
pkg_build_deps=(
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

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
