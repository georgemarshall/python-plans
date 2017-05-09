pkg_name=symsynd
pkg_distname=${pkg_name}
pkg_version=3.0.0
pkg_origin=python
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Helps symbolicating crash dumps."
pkg_upstream_url=http://github.com/getsentry/symsynd
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/s/symsynd/${pkg_dirname}.zip
pkg_shasum=796a7960dcf1e39cb192e9de4070b782d7777164758767f096c8c8fa20b445e4
pkg_deps=(
  core/gcc-libs
  core/libffi
  python/python
)
pkg_build_deps=(
  core/cmake
  core/gcc
  core/make
  core/patch
  core/rust
  python/cffi
  python/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_prepare() {
  export CC="$(pkg_path_for gcc)/bin/gcc"
  export CXX="$(pkg_path_for gcc)/bin/g++"

  patch -p0 -i "$PLAN_CONTEXT/buildsh.patch"
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
