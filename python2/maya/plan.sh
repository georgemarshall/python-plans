pkg_name=maya
pkg_distname=${pkg_name}
pkg_version=0.1.8
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Datetimes for Humans."
pkg_upstream_url=https://github.com/kennethreitz/maya
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/m/maya/${pkg_dirname}.tar.gz
pkg_shasum=25ab6555a9217b8d48e81eff62745890536906c0ea6bd190adce2a3faba48130
pkg_deps=(
  python2/python
  python2/dateparser
  python2/humanize
  python2/pendulum
  python2/pytz
  python2/ruamel-yaml
  python2/tzlocal
)
pkg_build_deps=(
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

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
