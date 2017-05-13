pkg_name=mistune
pkg_distname=${pkg_name}
pkg_version=0.7.4
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="The fastest markdown parser in pure Python"
pkg_upstream_url=https://github.com/lepture/mistune
pkg_dirname=${pkg_distname}-${pkg_version}
#pkg_source=https://pypi.org/packages/source/m/mmistune/${pkg_dirname}.tar.gz
pkg_source=https://files.pythonhosted.org/packages/25/a4/12a584c0c59c9fed529f8b3c47ca8217c0cf8bcc5e1089d3256410cfbdbc/${pkg_dirname}.tar.gz
pkg_shasum=8517af9f5cd1857bb83f9a23da75aa516d7538c32a2c5d5c56f3789a9e4cd22f
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/cython
  python2/nose
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

do_check() {
  python setup.py test
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
