pkg_name=djangorestframework2
pkg_distname=djangorestframework
pkg_version=2.4.8
pkg_origin=python2
pkg_license=('BSD-2-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Web APIs for Django, made easy."
pkg_upstream_url=http://www.django-rest-framework.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/d/djangorestframework/${pkg_dirname}.tar.gz
pkg_shasum=640b705ae7815ec60501631b7b611085e51c7f76607d90558bfe288f3f84b7aa
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
