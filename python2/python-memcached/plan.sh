pkg_name=python-memcached
pkg_distname=${pkg_name}
pkg_version=1.58
pkg_origin=python2
pkg_license=('Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Pure python memcached client"
pkg_upstream_url=http://www.tummy.com/Community/software/python-memcached/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/python-memcached/${pkg_dirname}.tar.gz
pkg_shasum=2775829cb54b9e4c5b3bbd8028680f0c0ab695db154b9c46f0f074ff97540eb6
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  core/memcached
  python2/nose
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

do_check() {
  hab sup start core/memcached
  sleep 3s
  nosetests
  hab sup stop core/memcached
  sleep 3s
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
