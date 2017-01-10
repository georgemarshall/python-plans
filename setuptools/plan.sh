pkg_name=python-setuptools
pkg_distname=setuptools
pkg_origin=python
pkg_version=32.3.1
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/s/setuptools/${pkg_dirname}.zip
pkg_shasum=806bae0840429c13f6e6e44499f7c0b87f3b269fdfbd815d769569c1daa7c351
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Easily download, build, install, upgrade, and uninstall
  Python packages"
pkg_upstream_url=https://github.com/pypa/setuptools
pkg_license=('MIT')
pkg_deps=(
  python/python
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
