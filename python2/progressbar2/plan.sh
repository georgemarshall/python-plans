pkg_name=progressbar2
pkg_distname=${pkg_name}
pkg_version=3.20.0
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A Python Progressbar library to provide visual (yet text \
based) progress to long running operations."
pkg_upstream_url=https://github.com/WoLpH/python-progressbar
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/progressbar2/${pkg_dirname}.tar.gz
pkg_shasum=a16d34da27bfa9800605f1de3342138e102797a4b8198864c8822e94caa0e5f7
pkg_deps=(
  python2/python
  python2/python-utils
)
pkg_build_deps=(
  python2/pytest-runner
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
