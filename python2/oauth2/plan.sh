pkg_name=oauth2
pkg_distname=${pkg_name}
pkg_version=1.9.0.post1
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="library for OAuth version 1.9"
pkg_upstream_url=http://github.com/joestump/python-oauth2
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/o/oauth2/${pkg_dirname}.tar.gz
pkg_shasum=c006a85e7c60107c7cc6da1b184b5c719f6dd7202098196dfa6e55df669b59bf
pkg_deps=(
  python2/python
  python2/httplib2
)
pkg_build_deps=(
  python2/coverage
  python2/mock
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
