pkg_name=vine
pkg_distname=${pkg_name}
pkg_version=1.1.3
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Promises, promises, promises."
pkg_upstream_url=http://github.com/celery/vine
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/v/vine/${pkg_dirname}.tar.gz
pkg_shasum=87b95da19249373430a8fafca36f1aecb7aa0f1cc78545877857afc46aea2441
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/case
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
