pkg_name=futures
pkg_distname=${pkg_name}
pkg_version=3.1.1
pkg_origin=python2
pkg_license=('Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Backport of the concurrent.futures package from Python 3.2"
pkg_upstream_url=https://github.com/agronholm/pythonfutures
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/f/futures/${pkg_dirname}.tar.gz
pkg_shasum=51ecb45f0add83c806c68e4b06106f90db260585b25ef2abfcda0bd95c0132fd
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
  python test_futures.py
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
