pkg_name=setuptools
pkg_distname=${pkg_name}
pkg_version=35.0.1
pkg_origin=python
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Easily download, build, install, upgrade, and uninstall \
Python packages"
pkg_upstream_url=https://github.com/pypa/setuptools
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/s/setuptools/${pkg_dirname}.zip
pkg_shasum=eea7f2ff55d4a810b6bc39be1ad1c60c2702341b78b2365c71306eaa7316beac
pkg_deps=(
  python/python
  python/appdirs
  python/packaging
  python/six
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
}
