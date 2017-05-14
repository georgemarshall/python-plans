pkg_name=flask-common
pkg_distname=Flask-Common
pkg_version=0.1.0
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A Flask extension with lots of common time-savers \
(file-serving, favicons, etc)."
pkg_upstream_url=https://github.com/phihag/flask-common
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/f/flask-common/${pkg_dirname}.tar.gz
pkg_shasum=20baeb4ab33ee2755bd4b3f0a525d8a070486f041d685ec0138b5a40390cae84
pkg_deps=(
  python2/python
  python2/crayons
  python2/flask
  python2/flask-cache
  python2/gunicorn
  python2/maya
  python2/whitenoise
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
