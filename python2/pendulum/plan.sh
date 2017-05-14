pkg_name=pendulum
pkg_distname=${pkg_name}
pkg_version=1.2.0
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python datetimes made easy."
pkg_upstream_url=https://github.com/sdispater/pendulum
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pendulum/${pkg_dirname}.tar.gz
pkg_shasum=641140a05f959b37a177866e263f6f53a53b711fae6355336ee832ec1a59da8a
pkg_deps=(
  python2/python
  python2/python-dateutil
  python2/pytzdata
  python2/tzlocal
)
pkg_build_deps=(
  core/gcc
  python2/cleo
  python2/nose
  python2/pytest
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
