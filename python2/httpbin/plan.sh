pkg_name=httpbin
pkg_distname=${pkg_name}
pkg_version=0.5.0
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="HTTP Request and Response Service"
pkg_upstream_url=https://github.com/Runscope/httpbin
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/h/httpbin/${pkg_dirname}.tar.gz
pkg_shasum=79fbc5d27e4194ea908b0fa18e09a59d95d287c91667aa69bcd010342d1589b5
pkg_deps=(
  python2/python
  python2/decorator
  python2/flask
  python2/flask-common
  python2/raven
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
