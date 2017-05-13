pkg_name=attrs
pkg_distname=${pkg_name}
pkg_version=16.3.0
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Attributes Without Boilerplate"
pkg_upstream_url=https://attrs.readthedocs.io/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/a/attrs/${pkg_dirname}.tar.gz
pkg_shasum=80203177723e36f3bbe15aa8553da6e80d47bfe53647220ccaa9ad7a5e473ccc
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/hypothesis
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
#  export PYTHONPATH="$PWD/build/lib:$PYTHONPATH"
#  pytest
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
