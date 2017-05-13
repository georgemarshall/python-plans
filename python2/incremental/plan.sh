pkg_name=incremental
pkg_distname=${pkg_name}
pkg_version=16.10.1
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Incremental is a small library that versions your Python projects."
pkg_upstream_url=https://github.com/hawkowl/incremental
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/i/incremental/${pkg_dirname}.tar.gz
pkg_shasum=14ad6b720ec47aad6c9caa83e47db1843e2b9b98742da5dda08e16a99f400342
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

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
