pkg_name=django-crispy-forms15
pkg_distname=django-crispy-forms
pkg_version=1.5.2
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Best way to have Django DRY forms"
pkg_upstream_url=http://github.com/maraujop/django-crispy-forms
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/d/django-crispy-forms/${pkg_dirname}.tar.gz
pkg_shasum=47ef7f74003b2a07a78ce6ed70b6472bf30efd7f8c3ef15fe0ca6685be2e0dfb
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
