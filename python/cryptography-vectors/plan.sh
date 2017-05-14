pkg_name=cryptography-vectors
pkg_distname=cryptography_vectors
pkg_version=1.8.1
pkg_origin=python
pkg_license=('Apache-2.0' 'BSD-3-Clause' 'Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Test vectors for the cryptography package."
pkg_upstream_url=https://cryptography.io/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/cryptography-vectors/${pkg_dirname}.tar.gz
pkg_shasum=2fd61facea08800ca98ac923f6d02f48a7ae6648025b29cdeb51987c1532add6
pkg_deps=(
  python/python
)
pkg_build_deps=(
  python/setuptools
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
