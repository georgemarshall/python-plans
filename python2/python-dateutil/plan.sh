pkg_name=python-dateutil
pkg_distname=${pkg_name}
pkg_version=2.6.0
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Extensions to the standard Python datetime module"
pkg_upstream_url=https://github.com/phihag/python-dateutil
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/python-dateutil/${pkg_dirname}.tar.gz
pkg_shasum=62a2f8df3d66f878373fd0072eacf4ee52194ba302e00082828e0d263b0418d2
pkg_deps=(
  python2/python
  python2/six
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
