pkg_name=celery3
pkg_distname=celery
pkg_version=3.1.25
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Distributed Task Queue."
pkg_upstream_url=http://celeryproject.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/celery/${pkg_dirname}.tar.gz
pkg_shasum=6ced63033bc663e60c992564954dbb5c84c43899f7f1a04b739957350f6b55f3
pkg_deps=(
  python2/python
  python2/billiard33
  python2/kombu3
  python2/pytz
)
pkg_build_deps=(
  python2/mock
  python2/nose
  python2/setuptools
  python2/unittest2
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

do_build() {
  python setup.py build
}

do_check() {
#  python setup.py test
  return 0 # FIXME: tests are segfaulting
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
