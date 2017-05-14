pkg_name=jmespath
pkg_distname=${pkg_name}
pkg_version=0.9.2
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="JSON Matching Expressions"
pkg_upstream_url=https://github.com/jmespath/jmespath.py
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/j/jmespath/${pkg_dirname}.tar.gz
pkg_shasum=54c441e2e08b23f12d7fa7d8e6761768c47c969e6aed10eead57505ba760aee9
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/nose
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

do_build() {
  python setup.py build
}

do_check() {
  nosetests
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
