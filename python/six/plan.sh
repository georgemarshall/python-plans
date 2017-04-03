pkg_name=six
pkg_distname=${pkg_name}
pkg_version=1.10.0
pkg_origin=python
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python 2 and 3 compatibility utilities"
pkg_upstream_url=https://github.com/benjaminp/six
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/s/six/${pkg_dirname}.tar.gz
pkg_shasum=105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a
pkg_deps=(
  python/python
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_begin() {
  add_path_env 'PYTHONPATH' 'lib/python3.6/site-packages'
}

do_build() {
  python setup.py build
}

do_install() {
  python setup.py install \
    --prefix="$pkg_prefix"
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
