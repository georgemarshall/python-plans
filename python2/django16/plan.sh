pkg_name=django16
pkg_distname=Django
pkg_version=1.6.11
pkg_origin=python2
pkg_license=('BSD')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A high-level Python Web framework that encourages rapid \
development and clean, pragmatic design."
pkg_upstream_url=https://www.djangoproject.com/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/d/django/${pkg_dirname}.tar.gz
pkg_shasum=7e50e573e484435873b3515d7982d80093b2695aba17fd0ff024307454dc3a56
pkg_deps=(
  python2/python
  python2/pytz
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
    --no-compile
}
