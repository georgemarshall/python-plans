pkg_name=django-templatetag-sugar
pkg_distname=${pkg_name}
pkg_version=1.0
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A library to make Django's template tags sweet."
pkg_upstream_url=http://github.com/alex/django-templatetag-sugar/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/d/django-templatetag-sugar/${pkg_dirname}.tar.gz
pkg_shasum=e9f630549f6c174cf328b385190e18bfe308f74dc7eca13458163d316ed29a5e
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
