pkg_name=pytzdata
pkg_distname=${pkg_name}
pkg_version=2017.2
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Official timezone database for Python."
pkg_upstream_url=https://github.com/sdispater/pytzdata
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pytzdata/${pkg_dirname}.tar.gz
pkg_shasum=a4d11b8123d00e947fac88508292b9e148da884fc64b884d9da3897a35fa2ab0
pkg_deps=(
  python2/python
)
pkg_build_deps=(
#  python2/nose
#  python2/pytest
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

# Tests not included in source release
#do_check() {
#  python setup.py test
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
