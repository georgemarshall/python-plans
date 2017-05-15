pkg_name=python-u2flib-server4
pkg_distname=python-u2flib-server
pkg_version=4.0.1
pkg_origin=python2
pkg_license=('BSD-2-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python based U2F server library"
pkg_upstream_url=https://github.com/Yubico/python-u2flib-server
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/python-u2flib-server/${pkg_dirname}.tar.gz
pkg_shasum=160425fe00407b06ce261a7d3c455a6a529ed73f71cfea1b436b573e1dff000b
pkg_deps=(
  python2/python
  python2/cryptography
  python2/enum34
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

do_check() {
  # Fix for the test dir so it gets treated as a module
  touch test/__init__.py
  python setup.py test
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
