pkg_name=django
pkg_distname=Django
pkg_version=1.11
pkg_origin=python2
pkg_license=('BSD')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A high-level Python Web framework that encourages rapid \
development and clean, pragmatic design."
pkg_upstream_url=https://www.djangoproject.com/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/d/django/${pkg_dirname}.tar.gz
pkg_shasum=b6f3b864944276b4fd1d099952112696558f78b77b39188ac92b6c5e80152c30
pkg_deps=(
  python2/python
  python2/pytz
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

do_begin() {
  add_path_env 'PYTHONPATH' 'lib/python2.7/site-packages'
}

do_build() {
  python setup.py build
}

do_install() {
  python setup.py install \
    --prefix="$pkg_prefix" \
    --old-and-unmanageable # bypass egg install
}

do_strip() {
  do_default_strip

  # Remove tests and bytecode files
  find "$pkg_prefix" -depth \
    \( \
      \( -type d -a -name test -o -name tests \) \
      -o \
      \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
    \) -exec rm -rf '{}' +
}
