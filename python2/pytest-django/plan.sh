pkg_name=pytest-django
pkg_distname=${pkg_name}
pkg_version=3.1.2
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A Django plugin for pytest."
pkg_upstream_url=https://pytest-django.readthedocs.io/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pytest-django/${pkg_dirname}.tar.gz
pkg_shasum=038ccc5a9daa1b1b0eb739ab7dce54e495811eca5ea3af4815a2a3ac45152309
pkg_deps=(
  python2/python
  python2/pytest
)
pkg_build_deps=(
  core/patch
  python2/setuptools
  python2/setuptools-scm
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_prepare() {
  patch -p0 -i "$PLAN_CONTEXT/setup.patch"
}

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
