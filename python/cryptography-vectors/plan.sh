pkg_name=cryptography-vectors
pkg_version=1.8.1
source ../python-plan-base.sh
pkg_distname=cryptography_vectors
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('Apache-2.0' 'BSD-3-Clause' 'Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Test vectors for the cryptography package."
pkg_upstream_url=https://cryptography.io/
pkg_source=https://pypi.org/packages/source/c/cryptography-vectors/${pkg_dirname}.tar.gz
pkg_shasum=2fd61facea08800ca98ac923f6d02f48a7ae6648025b29cdeb51987c1532add6
pkg_deps=( $pkg_origin/python )
pkg_build_deps=( $pkg_origin/setuptools )
