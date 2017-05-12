pkg_name=certifi
pkg_distname=${pkg_name}
pkg_version=2017.4.17
pkg_origin=python2
pkg_license=('MPL-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python package for providing Mozilla's CA Bundle."
pkg_upstream_url=http://certifi.io/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/c/certifi/${pkg_dirname}.tar.gz
pkg_shasum=f7527ebf7461582ce95f7a9e03dd141ce810d40590834f4ec20cddd54234c10a
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/setuptools
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
