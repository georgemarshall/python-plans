pkg_name=traceback2
pkg_distname=${pkg_name}
pkg_version=1.4.0
pkg_origin=python2
pkg_license=('Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Backports of the traceback module"
pkg_upstream_url=https://github.com/testing-cabal/traceback2
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/t/traceback2/${pkg_dirname}.tar.gz
pkg_shasum=05acc67a09980c2ecfedd3423f7ae0104839eccb55fc645773e1caa0951c3030
pkg_deps=(
  python2/python
  python2/linecache2
)
pkg_build_deps=(
  python2/pbr
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
