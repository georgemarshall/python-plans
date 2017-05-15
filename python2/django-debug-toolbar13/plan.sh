pkg_name=django-debug-toolbar13
pkg_distname=django-debug-toolbar
pkg_version=1.3.2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A configurable set of panels that display various debug \
information about the current request/response."
pkg_upstream_url=https://github.com/jazzband/django-debug-toolbar
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/d/django-debug-toolbar/${pkg_dirname}.tar.gz
pkg_shasum=6c1353b68a158642e14860f7278b81755e87bbda89e353673862c9079475d103
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
