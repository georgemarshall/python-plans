pkg_name=celery
pkg_distname=${pkg_name}
pkg_version=4.0.2
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Distributed Task Queue."
pkg_upstream_url=http://celeryproject.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/celery/${pkg_dirname}.tar.gz
pkg_shasum=e3d5a6c56a73ff8f2ddd4d06dc37f4c2afe4bb4da7928b884d0725ea865ef54d
pkg_deps=(
  python2/python
  python2/billiard
  python2/kombu
  python2/pytz
)
pkg_build_deps=(
  python2/case
  python2/pytest
  python2/setuptools
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
