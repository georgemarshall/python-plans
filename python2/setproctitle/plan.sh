pkg_name=setproctitle
pkg_distname=${pkg_name}
pkg_version=1.1.10
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A Python module to customize the process title"
pkg_upstream_url=https://github.com/phihag/setproctitle
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/s/setproctitle/${pkg_dirname}.zip
pkg_shasum=6a035eddac62898786aed2c2eee7334c28cfc8106e8eb29fdd117cac56c6cdf0
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  core/gcc
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
