pkg_name=symsynd
pkg_distname=${pkg_name}
pkg_version=2.4.0
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Helps symbolicating crash dumps."
pkg_upstream_url=http://github.com/getsentry/symsynd
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://github.com/getsentry/symsynd/archive/${pkg_version}.tar.gz
pkg_shasum=f77d60c837127541c9163c1b212e9b57e3338ecb034eb2291f5e8b9d3346fdf1
pkg_deps=(
  core/gcc-libs
  core/libffi
  python2/python
)
pkg_build_deps=(
  core/cmake
  core/gcc
  core/make
  core/patch
  python2/cffi
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_begin() {
  add_path_env 'PYTHONPATH' 'lib/python2.7/site-packages'
}

do_prepare() {
  export CC="$(pkg_path_for gcc)/bin/gcc"
  export CXX="$(pkg_path_for gcc)/bin/g++"

  patch -p0 -i "$PLAN_CONTEXT/buildsh.patch"
}

do_build() {
  python setup.py build
}

do_install() {
  python setup.py install \
    --prefix="$pkg_prefix" \
    --old-and-unmanageable # bypass egg install
}

do_strip() {
  do_default_strip

  # Remove tests and bytecode files
  find "$pkg_prefix" -depth \
    \( \
      \( -type d -a -name test -o -name tests \) \
      -o \
      \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
    \) -exec rm -rf '{}' +
}
