pkg_name=django-debug-toolbar
pkg_distname=${pkg_name}
pkg_version=1.8
pkg_license=('PBSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A configurable set of panels that display various debug \
information about the current request/response."
pkg_upstream_url=https://github.com/jazzband/django-debug-toolbar
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/d/django-debug-toolbar/${pkg_dirname}.tar.gz
pkg_shasum=e9f08b94f9423ac76cfc287151182bbaddbe7521ae32bef9f9863e2ac58018d3
pkg_deps=(
  python2/python
  python2/sqlparse
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
