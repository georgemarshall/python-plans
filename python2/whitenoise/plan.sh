pkg_name=whitenoise
pkg_distname=${pkg_name}
pkg_version=3.3.0
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Radically simplified static file serving for WSGI applications"
pkg_upstream_url=http://whitenoise.evans.io/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/w/whitenoise/${pkg_dirname}.tar.gz
pkg_shasum=d098327276de6fd189398a7bcb95789d1bb2d41b3e011eeae4562f6b1a107dd4
pkg_deps=(
  python2/python
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
