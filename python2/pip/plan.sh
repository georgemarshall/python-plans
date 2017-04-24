pkg_name=pip
pkg_distname=${pkg_name}
pkg_version=9.0.1
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="The PyPA recommended tool for installing Python packages."
pkg_upstream_url=https://pip.pypa.io/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pip/${pkg_dirname}.tar.gz
pkg_shasum=09f243e1a7b461f654c26a725fa373211bb7ff17a9300058b205c61658ca940d
pkg_deps=(
  python2/python
  python2/setuptools
  python2/wheel
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
    --no-compile \
    --old-and-unmanageable # bypass egg install

  cat <<EOF > "$pkg_prefix/$PYTHON_SITE_PACKAGES/_manylinux.py"
# Disable binary manylinux1(CentOS 5) wheel support
manylinux1_compatible = False
EOF
}
