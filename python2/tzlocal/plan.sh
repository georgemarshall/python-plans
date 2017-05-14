pkg_name=tzlocal
pkg_distname=${pkg_name}
pkg_version=1.4
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="tzinfo object for the local timezone"
pkg_upstream_url=https://github.com/regebro/tzlocal
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/t/tzlocal/${pkg_dirname}.tar.gz
pkg_shasum=05a2908f7fb1ba8843f03b2360d6ad314dbf2bce4644feb702ccd38527e13059
pkg_deps=(
  python2/python
  python2/pytz
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

do_check() {
  python setup.py test
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
