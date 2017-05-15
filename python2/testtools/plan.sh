pkg_name=testtools
pkg_distname=${pkg_name}
pkg_version=2.3.0
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Extensions to the Python standard library unit testing framework"
pkg_upstream_url=https://github.com/testing-cabal/testtools
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/t/testtools/${pkg_dirname}.tar.gz
pkg_shasum=5827ec6cf8233e0f29f51025addd713ca010061204fdea77484a2934690a0559
pkg_deps=(
  python2/python
  python2/extras
  python2/fixtures
  python2/pbr
  python2/python-mimeparse
  python2/traceback2
  python2/unittest2
)
pkg_build_deps=(
  python2/setuptools
  python2/testscenarios
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

do_check() {
  python -m testtools.run testtools.tests.test_suite
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
