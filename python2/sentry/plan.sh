pkg_name=sentry
pkg_distname=${pkg_name}
pkg_version=8.15.0
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A realtime logging and aggregation server."
pkg_upstream_url=http://github.com/getsentry/symsynd
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/s/sentry/${pkg_dirname}.tar.gz
pkg_shasum=f80315439197d2c70ed1e1c191731e1c2c14a80af3d7faf43a0e4ed37d5391f8
pkg_deps=(
  python2/python
  python2/setuptools
)
pkg_build_deps=(
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
