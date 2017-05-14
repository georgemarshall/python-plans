pkg_name=djangorestframework
pkg_distname=${pkg_name}
pkg_version=3.6.3
pkg_origin=python2
pkg_license=('BSD-2-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Web APIs for Django, made easy."
pkg_upstream_url=http://www.django-rest-framework.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/d/djangorestframework/${pkg_dirname}.tar.gz
pkg_shasum=6aa6aafdfb7f6152a401873ecae93aff9eb54d7a74266065347cf4de68278ae4
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
