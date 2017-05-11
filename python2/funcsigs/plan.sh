pkg_name=funcsigs
pkg_distname=${pkg_name}
pkg_version=1.0.2
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python function signatures from PEP362 for Python 2.6, 2.7 and 3.2+"
pkg_upstream_url=http://funcsigs.readthedocs.org
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/f/funcsigs/${pkg_dirname}.tar.gz
pkg_shasum=a7bb0f2cf3a3fd1ab2732cb49eba4252c2af4240442415b4abce3b87022a8f50
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/setuptools
  python2/unittest2
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

do_check() {
  python setup.py test
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
