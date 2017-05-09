pkg_name=libsourcemap
pkg_distname=${pkg_name}
pkg_version=0.6.0
pkg_origin=python2
pkg_license=('BSD')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Helps working with sourcemaps."
pkg_upstream_url=https://github.com/getsentry/libsourcemap
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/l/libsourcemap/${pkg_dirname}.zip
pkg_shasum=61583d165ed0fc6548501a4495ea6e4f925cabf8a7a8916ef679963813f074ff
pkg_deps=(
  core/gcc-libs
  python2/python
)
pkg_build_deps=(
  core/gcc
  core/llvm
  core/make
  core/rust
  python2/cffi
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_prepare() {
  export CC="$(pkg_path_for gcc)/bin/gcc"
  export CXX="$(pkg_path_for gcc)/bin/g++"
}

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
