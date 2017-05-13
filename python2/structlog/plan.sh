pkg_name=structlog
pkg_distname=${pkg_name}
pkg_version=17.1.0
pkg_origin=python2
pkg_license=('Apache-2.0' 'MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Structured Logging for Python"
pkg_upstream_url=http://www.structlog.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/s/structlog/${pkg_dirname}.tar.gz
pkg_shasum=5c8bd391e269ea4e670cd0463bae88e0c2ff1d10c23adbe1d01c21662ce4c240
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
