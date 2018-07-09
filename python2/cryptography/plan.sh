pkg_name=cryptography
source ../../python/${pkg_name}/plan.sh
source ../python-plan-base.sh
pkg_deps=(
  core/gcc-libs
  core/openssl
  $pkg_origin/python
  $pkg_origin/asn1crypto
  $pkg_origin/cffi
  $pkg_origin/enum34
  $pkg_origin/idna
  $pkg_origin/six
  $pkg_origin/ipaddress
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
