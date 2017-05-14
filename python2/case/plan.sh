pkg_name=case
pkg_distname=${pkg_name}
pkg_version=1.5.3
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python unittest Utilities"
pkg_upstream_url=http://github.com/celery/case
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/case/${pkg_dirname}.tar.gz
pkg_shasum=48432b01d91913451c3512c5b90e31b0f348f1074b166a3431085eb70d784fb1
pkg_deps=(
  python2/python
  python2/mock
  python2/nose
  python2/six
  python2/unittest2
)
pkg_build_deps=(
  python2/coverage
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
