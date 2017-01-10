pkg_name=python-wheel
pkg_distname=wheel
pkg_origin=python
pkg_version=0.29.0
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/w/wheel/${pkg_dirname}.tar.gz
pkg_shasum=1ebb8ad7e26b448e9caa4773d2357849bf80ff9e313964bcaf79cbf0201a1648
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A built-package format for Python."
pkg_upstream_url=https://bitbucket.org/pypa/wheel/
pkg_license=('MIT')
pkg_deps=(
  python/python
  python/python-setuptools
)
pkg_bin_dirs=(bin)
pkg_python_dirs=(lib/python3.6/site-packages)

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
