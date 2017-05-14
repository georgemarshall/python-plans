pkg_name=twisted
pkg_distname=Twisted
pkg_version=17.1.0
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="An asynchronous networking framework written in Python"
pkg_upstream_url=http://twistedmatrix.com/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/t/twisted/${pkg_dirname}.tar.bz2
pkg_shasum=dbf211d70afe5b4442e3933ff01859533eba9f13d8b3e2e1b97dc2125e2d44dc
pkg_deps=(
  python2/python
  python2/automat
  python2/constantly
  python2/incremental
  python2/setuptools
  python2/zope-interface
)
pkg_build_deps=(
  core/gcc
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

do_build() {
  python setup.py build
}

#do_check() {
#  python setup.py test --test-suite twisted.python.test
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
