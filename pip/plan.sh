pkg_name=python-pip
pkg_distname=pip
pkg_origin=python
pkg_version=9.0.1
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pip/${pkg_dirname}.tar.gz
pkg_shasum=09f243e1a7b461f654c26a725fa373211bb7ff17a9300058b205c61658ca940d
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="The PyPA recommended tool for installing Python packages."
pkg_upstream_url=https://pip.pypa.io/
pkg_license=('MIT')
pkg_deps=(
  python/python
  python/python-setuptools
  python/python-wheel
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

  cat <<EOF > "$pkg_prefix/lib/python3.6/site-packages/_manylinux.py"
# Disable binary manylinux1(CentOS 5) wheel support
manylinux1_compatible = False
EOF
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
