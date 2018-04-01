pkg_name=hypothesis
pkg_distname=${pkg_name}
pkg_version=3.8.2
pkg_origin="${HAB_ORIGIN:-python2}"
pkg_license=('MPL-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A library for property based testing"
pkg_upstream_url=https://github.com/HypothesisWorks/hypothesis-python
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/h/hypothesis/${pkg_dirname}.tar.gz
pkg_shasum=da2f7cafc993712beff585291bdc025ad39960a59aaff16dfe80f0146b0ff11c
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/enum34
)
pkg_build_deps=(
  $pkg_origin/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
do_setup_environment() {
   push_buildtime_env PYTHONPATH "${pkg_prefix}/lib/python2.7/site-packages"
   push_runtime_env PYTHONPATH "${pkg_prefix}/lib/python2.7/site-packages"
}

do_build() {
  python setup.py build
}

do_install() {
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
