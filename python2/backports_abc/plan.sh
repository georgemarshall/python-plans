pkg_name=backports_abc
pkg_distname=${pkg_name}
pkg_version=0.5
pkg_origin=python2
pkg_license=('Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A backport of recent additions to the 'collections.abc' module."
pkg_upstream_url=https://github.com/cython/backports_abc
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/b/backports_abc/${pkg_dirname}.tar.gz
pkg_shasum=033be54514a03e255df75c5aee8f9e672f663f93abb723444caec8fe43437bde
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

do_check() {
  python setup.py test --test-suite tests
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
