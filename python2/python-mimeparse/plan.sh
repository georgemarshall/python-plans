pkg_name=python-mimeparse
pkg_distname=${pkg_name}
pkg_version=1.6.0
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A module provides basic functions for parsing mime-type \
names and matching them against a list of media-ranges."
pkg_upstream_url=https://github.com/dbtsai/python-mimeparse
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/python-mimeparse/${pkg_dirname}.tar.gz
pkg_shasum=76e4b03d700a641fd7761d3cd4fdbbdcd787eade1ebfac43f877016328334f78
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
  python mimeparse_test.py
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
