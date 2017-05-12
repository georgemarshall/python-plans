pkg_name=pyopenssl
pkg_distname=pyOpenSSL
pkg_version=17.0.0
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python wrapper module around the OpenSSL library"
pkg_upstream_url=https://pyopenssl.readthedocs.io/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pyopenssl/${pkg_dirname}.tar.gz
pkg_shasum=48abfe9d2bb8eb8d8947c8452b0223b7b1be2383b332f3b4f248fe59ef0bafdd
pkg_deps=(
  python2/python
  python2/cryptography
  python2/six
)
pkg_build_deps=(
  python2/pytest
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

#do_check() {
#  export PYTHONPATH="$PWD/src:$PYTHONPATH"
#  pytest
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
