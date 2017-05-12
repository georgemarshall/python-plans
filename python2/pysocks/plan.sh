pkg_name=pysocks
pkg_distname=PySocks
pkg_version=1.6.7
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A Python SOCKS client module. See \
https://github.com/Anorov/PySocks for more information."
pkg_upstream_url=https://github.com/Anorov/PySocks
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pysocks/${pkg_dirname}.tar.gz
pkg_shasum=d00329f27efa157db7efe3ca26fcd69033cd61f83822461ee3f8a353b48e33cf
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/psutil
  python2/pytest
  python2/setuptools
  python2/test-server
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

#do_check() {
#  pytest
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
