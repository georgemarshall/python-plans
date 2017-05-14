pkg_name=crayons
pkg_distname=${pkg_name}
pkg_version=0.1.2
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="TextUI colors for Python."
pkg_upstream_url=https://github.com/kennethreitz/crayons
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/crayons/${pkg_dirname}.tar.gz
pkg_shasum=5e17691605e564d63482067eb6327d01a584bbaf870beffd4456a3391bd8809d
pkg_deps=(
  python2/python
  python2/colorama
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

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
