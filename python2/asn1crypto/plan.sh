pkg_name=asn1crypto
source ../../python/${pkg_name}/plan.sh
source ../python-plan-base.sh
pkg_deps=( $pkg_origin/python )
pkg_build_deps=( $pkg_origin/setuptools )
