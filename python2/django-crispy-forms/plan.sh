pkg_name=django-crispy-forms
pkg_distname=${pkg_name}
pkg_version=1.6.1
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Best way to have Django DRY forms"
pkg_upstream_url=http://github.com/maraujop/django-crispy-forms
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/d/django-crispy-forms/${pkg_dirname}.tar.gz
pkg_shasum=c894f3a44e111ae6c6226c67741d96d120adb942de41dc8b2a991b87de7ff9c0
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
