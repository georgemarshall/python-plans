pkg_name=redis
pkg_distname=${pkg_name}
pkg_version=2.10.5
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python client for Redis key-value store"
pkg_upstream_url=http://github.com/andymccurdy/redis-py
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/r/redis/${pkg_dirname}.tar.gz
pkg_shasum=5dfbae6acfc54edf0a7a415b99e0b21c0a3c27a7f787b292eea727b1facc5533
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  core/redis
  python2/pytest
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

do_check() {
  hab sup start core/redis
  sleep 3s
  python setup.py test
  hab sup stop core/redis
  sleep 3s
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
