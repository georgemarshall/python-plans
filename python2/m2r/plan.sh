pkg_name=m2r
pkg_distname=${pkg_name}
pkg_version=0.1.5
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Markdown to reStructuredText converter"
pkg_upstream_url=https://github.com/miyakogi/m2r
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/m/m2r/${pkg_dirname}.tar.gz
pkg_shasum=3448f770aed05ca10390d0917cd51836cbf82a2f095bc91507e6291cfab03223
pkg_deps=(
  python2/docutils
  python2/mistune
  python2/python
)
pkg_build_deps=(
  python2/mock
  python2/setuptools
#  python2/sphinx
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

do_build() {
  python setup.py build
}

#do_check() {
#  python setup.py test --test-suite tests
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
