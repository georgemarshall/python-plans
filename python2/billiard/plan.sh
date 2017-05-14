pkg_name=billiard
pkg_distname=${pkg_name}
pkg_version=3.5.0.2
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python multiprocessing fork with improvements and bugfixes"
pkg_upstream_url=http://github.com/celery/billiard
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/b/billiard/${pkg_dirname}.tar.gz
pkg_shasum=3eb01a8fe44116aa6d63d2010515ef1526e40caee5f766f75b2d28393332dcaa
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  core/gcc
  python2/case
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
  python setup.py test
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
