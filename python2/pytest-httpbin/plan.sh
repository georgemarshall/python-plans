pkg_name=pytest-httpbin
pkg_distname=${pkg_name}
pkg_version=0.0.7
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Easily test your HTTP library against a local copy of httpbin"
pkg_upstream_url=https://github.com/kevin1024/pytest-httpbin
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pytest-httpbin/${pkg_dirname}.tar.gz
pkg_shasum=03af8a7055c8bbcb68b14d9a14c103c82c97aeb86a8f1b29cd63d83644c2f021
pkg_deps=(
  python2/python
  python2/decorator
  python2/flask
  python2/httpbin
  python2/setuptools
  python2/six
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

do_build() {
  python setup.py build
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
