pkg_name=billiard33
pkg_distname=billiard
pkg_version=3.3.0.23
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python multiprocessing fork with improvements and bugfixes"
pkg_upstream_url=http://github.com/celery/billiard
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/b/billiard/${pkg_dirname}.tar.gz
pkg_shasum=692a2a5a55ee39a42bcb7557930e2541da85df9ea81c6e24827f63b80cd39d0b
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  core/gcc
  python2/nose
  python2/mock
  python2/setuptools
  python2/unittest2
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

do_check() {
  python setup.py test
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
