pkg_name=hypothesis
pkg_version=3.8.2
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MPL-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A library for property based testing"
pkg_upstream_url=https://github.com/HypothesisWorks/hypothesis-python
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/h/hypothesis/${pkg_dirname}.tar.gz
pkg_shasum=da2f7cafc993712beff585291bdc025ad39960a59aaff16dfe80f0146b0ff11c
pkg_deps=( $pkg_origin/python )
pkg_build_deps=( $pkg_origin/setuptools )
