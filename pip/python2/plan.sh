source ../plan.sh

pkg_name=python2-pip
pkg_deps=(
  python/python2
  python/python2-setuptools
  python/python2-wheel
)
pkg_python_dirs=(lib/python2.7/site-packages)

do_install() {
  python setup.py install \
    --prefix="$pkg_prefix" \
    --old-and-unmanageable # bypass egg install

  cat <<EOF > "$pkg_prefix/lib/python2.7/site-packages/_manylinux.py"
# Disable binary manylinux1(CentOS 5) wheel support
manylinux1_compatible = False
EOF
}
