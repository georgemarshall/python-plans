pkg_name=statsd31
pkg_distname=statsd
pkg_version=3.1
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A simple statsd client."
pkg_upstream_url=https://github.com/jsocol/pystatsd
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/s/statsd/${pkg_dirname}.tar.gz
pkg_shasum=fbae5feb33ae9394c275bc834ab94684b94de03acc8f36387bd0bf0c51ef28ee
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/mock
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
  python setup.py test
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
