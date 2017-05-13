pkg_name=automat
pkg_distname=Automat
pkg_version=0.5.0
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Self-service finite-state machines for the programmer on the go."
pkg_upstream_url=https://github.com/glyph/Automat
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/a/automat/${pkg_dirname}.tar.gz
pkg_shasum=4889ec6763377432ec4db265ad552bbe956768ea3fff39014855308ba79dd7c2
pkg_deps=(
  python2/python
  python2/attrs
  python2/six
)
pkg_build_deps=(
  python2/m2r
  python2/pytest
  python2/setuptools
  python2/setuptools-scm
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

do_build() {
  python setup.py build
}

do_check() {
  pytest
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
