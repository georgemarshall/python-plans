pkg_name=raven
pkg_distname=${pkg_name}
pkg_version=6.0.0
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Raven is a client for Sentry (https://getsentry.com)"
pkg_upstream_url=https://github.com/getsentry/raven-python
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/r/raven/${pkg_dirname}.zip
pkg_shasum=cee2d745c762230383fc89365770552c93c71205ee92c6e6bbbd85fe4dbb2803
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
