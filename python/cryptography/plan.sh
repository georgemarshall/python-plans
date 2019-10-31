pkg_name=cryptography
pkg_version=1.8.1
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('Apache-2.0' 'BSD-3-Clause' 'Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Cryptography is a package which provides cryptographic \
recipes and primitives to Python developers."
pkg_upstream_url=https://cryptography.io/
pkg_source=https://pypi.org/packages/source/c/cryptography/${pkg_dirname}.tar.gz
pkg_shasum=323524312bb467565ebca7e50c8ae5e9674e544951d28a2904a50012a8828190
pkg_deps=(
  core/gcc-libs
  core/openssl
  $pkg_origin/python
  $pkg_origin/asn1crypto
  $pkg_origin/cffi
  $pkg_origin/idna
  $pkg_origin/six
)
pkg_build_deps=(
  core/gcc
  $pkg_origin/cryptography-vectors
  $pkg_origin/hypothesis
  $pkg_origin/iso8601
  $pkg_origin/pretend
  $pkg_origin/pytest
  $pkg_origin/pytz
  $pkg_origin/setuptools
)

do_check() {
  python setup.py test
}
