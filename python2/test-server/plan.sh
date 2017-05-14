pkg_name=test-server
pkg_distname=${pkg_name}
pkg_version=0.0.27
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Server to test HTTP clients"
pkg_upstream_url=https://github.com/lorien/test_server
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/t/test-server/${pkg_dirname}.tar.gz
pkg_shasum=b83f7c652ba79319805d4241cf7a05b8bf0e25b1547dcba3d4193c5f35c49293
pkg_deps=(
  python2/python
  python2/filelock
  python2/psutil
  python2/setuptools
  python2/six
  python2/tornado
)
pkg_build_deps=(
  python2/pytest
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

do_build() {
  python setup.py build
}

do_check() {
  pytest
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
