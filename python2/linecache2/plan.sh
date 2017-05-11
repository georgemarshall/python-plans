pkg_name=linecache2
pkg_distname=${pkg_name}
pkg_version=1.0.0
pkg_origin=python2
pkg_license=('Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Backports of the linecache module"
pkg_upstream_url=https://github.com/testing-cabal/traceback2
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/l/linecache2/${pkg_dirname}.tar.gz
pkg_shasum=4b26ff4e7110db76eeb6f5a7b64a82623839d595c2038eeda662f2a2db78e97c
pkg_deps=(
  python2/python
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
