source ../../packages/pip.sh
source ../default.sh

pkg_deps=(
  python/python
  python/setuptools
  python/wheel
)

do_install() {
  python setup.py install \
    --prefix="$pkg_prefix" \
    --old-and-unmanageable # bypass egg install

  cat <<EOF > "$pkg_prefix/lib/python3.6/site-packages/_manylinux.py"
# Disable binary manylinux1(CentOS 5) wheel support
manylinux1_compatible = False
EOF
}
