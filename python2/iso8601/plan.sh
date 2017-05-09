pkg_name=iso8601
pkg_distname=${pkg_name}
pkg_version=0.1.11
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Simple module to parse ISO 8601 dates"
pkg_upstream_url=https://bitbucket.org/micktwomey/pyiso8601
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/i/iso8601/${pkg_dirname}.tar.gz
pkg_shasum=e8fb52f78880ae063336c94eb5b87b181e6a0cc33a6c008511bac9a6e980ef30
pkg_deps=(
  python2/python
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
