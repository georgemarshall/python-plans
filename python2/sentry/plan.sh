pkg_name=sentry
pkg_distname=${pkg_name}
pkg_version=8.16.0
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A realtime logging and aggregation server."
pkg_upstream_url=http://github.com/getsentry/symsynd
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/s/sentry/${pkg_dirname}.tar.gz
pkg_shasum=83e7248889f76473662b55e7b55d667eb9e0e5baf00ea0ebc197bbeb24767676
pkg_deps=(
  python2/python
#  python2/cryptography
  python2/enum34
  python2/ipaddress
  python2/libsourcemap
  python2/lxml
  python2/pillow
  python2/psycopg2
  python2/python-u2flib-server40
  python2/qrcode
  python2/setuptools
  python2/simplejson
  python2/symsynd
  python2/uwsgi
)
#pkg_build_deps=(
#  core/patch
#)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

#do_prepare() {
#  patch -p0 -i "$PLAN_CONTEXT/setup.patch"
#}

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
