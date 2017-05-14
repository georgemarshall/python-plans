pkg_name=cleo
pkg_distname=${pkg_name}
pkg_version=0.6.0
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Cleo allows you to create beautiful and testable \
command-line interfaces."
pkg_upstream_url=https://github.com/sdispater/cleo
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/cleo/${pkg_dirname}.tar.gz
pkg_shasum=818646a23e6bfc459be3a56651d3831de2f568a5262af04be86902fc18c67144
pkg_deps=(
  python2/python
  python2/backpack
  python2/pastel
  python2/psutil
  python2/pylev
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
