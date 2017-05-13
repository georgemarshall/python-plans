pkg_name=structlog16
pkg_distname=structlog
pkg_version=16.1.0
pkg_origin=python2
pkg_license=('Apache-2.0' 'MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Structured Logging for Python"
pkg_upstream_url=http://www.structlog.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/s/structlog/${pkg_dirname}.tar.gz
pkg_shasum=b44dfaadcbab84e6bb97bd9b263f61534a79611014679757cd93e2359ee7be01
pkg_deps=(
  python2/python
  python2/six
)
pkg_build_deps=(
  python2/freezegun
  python2/pretend
  python2/pytest
  python2/setuptools
  python2/simplejson
  python2/twisted
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

do_check() {
  export PYTHONPATH="$PWD/build/lib:$PYTHONPATH"
  pytest
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
