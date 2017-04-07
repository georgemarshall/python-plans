pkg_name=coverage
pkg_distname=${pkg_name}
pkg_version=4.3.4
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Code coverage measurement for Python"
pkg_upstream_url=https://coverage.readthedocs.io
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/coverage/${pkg_dirname}.tar.gz
pkg_shasum=eaaefe0f6aa33de5a65f48dd0040d7fe08cac9ac6c35a56d0a7db109c3e733df
pkg_deps=(
  python2/python
  python2/setuptools
)
pkg_build_deps=(
  core/gcc
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

do_begin() {
  add_path_env 'PYTHONPATH' 'lib/python2.7/site-packages'
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
