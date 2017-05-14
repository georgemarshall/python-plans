pkg_name=contextlib2
pkg_distname=${pkg_name}
pkg_version=0.5.5
pkg_origin=python2
pkg_license=('Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Backports and enhancements for the contextlib module"
pkg_upstream_url=http://contextlib2.readthedocs.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/contextlib2/${pkg_dirname}.tar.gz
pkg_shasum=509f9419ee91cdd00ba34443217d5ca51f5a364a404e1dce9e8979cea969ca48
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/setuptools
  python2/unittest2
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

do_check() {
  python test_contextlib2.py
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
