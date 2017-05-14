pkg_name=pylev
pkg_distname=${pkg_name}
pkg_version=1.3.0
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A pure Python Levenshtein implementation that's not freaking GPL'd."
pkg_upstream_url=http://github.com/toastdriven/pylev
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pylev/${pkg_dirname}.tar.gz
pkg_shasum=063910098161199b81e453025653ec53556c1be7165a9b7c50be2f4d57eae1c3
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
