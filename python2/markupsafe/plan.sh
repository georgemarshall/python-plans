pkg_name=markupsafe
pkg_distname=MarkupSafe
pkg_version=1.0
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Implements a XML/HTML/XHTML Markup safe string for Python"
pkg_upstream_url=http://github.com/pallets/markupsafe
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/m/markupsafe/${pkg_dirname}.tar.gz
pkg_shasum=a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  core/gcc
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
