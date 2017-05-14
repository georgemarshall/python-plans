pkg_name=raven5
pkg_distname=raven
pkg_version=5.33.0
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Raven is a client for Sentry (https://getsentry.com)"
pkg_upstream_url=https://github.com/getsentry/raven-python
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/r/raven/${pkg_dirname}.tar.gz
pkg_shasum=85af57123d22e9cbe6d1de671c27d337cec45b22e7d5b907578281f8384a2822
pkg_deps=(
  python2/python
  python2/contextlib2
)
pkg_build_deps=(
  python2/setuptools
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
