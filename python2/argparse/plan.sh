pkg_name=argparse
pkg_distname=${pkg_name}
pkg_version=1.4.0
pkg_origin=python2
pkg_license=('Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python command-line parsing library"
pkg_upstream_url=https://github.com/ThomasWaldmann/argparse/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/a/argparse/${pkg_dirname}.tar.gz
pkg_shasum=62b089a55be1d8949cd2bc7e0df0bddb9e028faefc8c32038cc84862aefdd6e4
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

do_check() {
  touch test/__init__.py
  python setup.py test --test-suite test
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
