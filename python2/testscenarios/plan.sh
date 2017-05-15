pkg_name=testscenarios
pkg_distname=${pkg_name}
pkg_version=0.5.0
pkg_origin=python2
pkg_license=('Apache-2.0', 'BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Testscenarios, a pyunit extension for dependency injection"
pkg_upstream_url=https://launchpad.net/testscenarios
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/t/testscenarios/${pkg_dirname}.tar.gz
pkg_shasum=c257cb6b90ea7e6f8fef3158121d430543412c9a87df30b5dde6ec8b9b57a2b6
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/pbr
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
