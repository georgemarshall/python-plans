pkg_name=pytest-html
pkg_distname=${pkg_name}
pkg_version=1.14.2
pkg_origin=python2
pkg_license=('MPL-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="pytest plugin for generating HTML reports"
pkg_upstream_url=https://github.com/pytest-dev/pytest-html
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pytest-html/${pkg_dirname}.tar.gz
pkg_shasum=bf6672c2552b26059acf9cd678701c35de18bc1b20467940d830202e7fb1bc66
pkg_deps=(
  python2/python
  python2/pytest
  python2/pytest-metadata
)
pkg_build_deps=(
  python2/setuptools
  python2/setuptools-scm
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
