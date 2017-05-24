pkg_name=greenlet
pkg_distname=${pkg_name}
pkg_version=0.4.12
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Lightweight in-process concurrent programming"
pkg_upstream_url=https://github.com/python-greenlet/greenlet
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/g/greenlet/${pkg_dirname}.tar.gz
pkg_shasum=e4c99c6010a5d153d481fdaf63b8a0782825c0721506d880403a3b9b82ae347e
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  core/gcc
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_include_dirs=(include)

do_build() {
  python setup.py build
}

do_check() {
  export GREENLET_TEST_CPP=0
  python setup.py test
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile
}
