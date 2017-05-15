pkg_name=requests-mock
pkg_distname=${pkg_name}
pkg_version=1.3.0
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Mock out responses from the requests package"
pkg_upstream_url=https://requests-mock.readthedocs.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/r/requests-mock/${pkg_dirname}.tar.gz
pkg_shasum=bd86970d6c52cc97071f5185aa594de6a997a5ca63b3bb36aceb9bb9db49294b
pkg_deps=(
  python2/python
  python2/requests
  python2/six
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
