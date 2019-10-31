pkg_name=pycparser
pkg_version=2.17
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="C parser in Python"
pkg_upstream_url=https://github.com/eliben/pycparser
pkg_source=https://pypi.org/packages/source/p/pycparser/${pkg_dirname}.tar.gz
pkg_shasum=0aac31e917c24cb3357f5a4d5566f2cc91a19ca41862f6c3c22dc60a629673b6
pkg_deps=( $pkg_origin/python )
pkg_build_deps=( core/gcc )

do_check() {
  python tests/all_tests.py
}
