pkg_name=python-dateutil1
pkg_distname=python-dateutil
pkg_version=1.5
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Extensions to the standard Python datetime module"
pkg_upstream_url=https://github.com/phihag/python-dateutil
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/python-dateutil/${pkg_dirname}.tar.gz
pkg_shasum=6f197348b46fb8cdf9f3fcfc2a7d5a97da95db3e2e8667cf657216274fe1b009
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
  python setup.py test --test-suite test
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
