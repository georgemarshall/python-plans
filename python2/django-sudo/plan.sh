pkg_name=django-sudo
pkg_distname=${pkg_name}
pkg_version=2.1.0
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Extra security for your sensitive pages"
pkg_upstream_url=https://github.com/mattrobenolt/django-sudo
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/d/django-sudo/${pkg_dirname}.tar.gz
pkg_shasum=375a3100127dfcf49f24184ca25a1c84178470d6918c6a88e63472de030047a6
pkg_deps=(
  python2/python
)
pkg_build_deps=(
#  python2/flake8
#  python2/pytest
#  python2/pytest-cov
#  python2/pytest-django
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

# Tests not included in source release
#do_check() {
#  python setup.py test
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
