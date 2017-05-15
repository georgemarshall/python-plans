pkg_name=honcho
pkg_distname=${pkg_name}
pkg_version=1.0.1
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Honcho: a Python clone of Foreman. For managing \
Procfile-based applications."
pkg_upstream_url=https://github.com/nickstenning/honcho
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/h/honcho/${pkg_dirname}.tar.gz
pkg_shasum=c189402ad2e337777283c6a12d0f4f61dc6dd20c254c9a3a4af5087fc66cea6e
pkg_deps=(
  python2/python
  python2/setuptools
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
