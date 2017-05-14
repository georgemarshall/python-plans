pkg_name=decorator
pkg_distname=${pkg_name}
pkg_version=4.0.11
pkg_origin=python2
pkg_license=('BSD-2-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Better living through Python with decorators"
pkg_upstream_url=https://github.com/micheles/decorator
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/d/decorator/${pkg_dirname}.tar.gz
pkg_shasum=953d6bf082b100f43229cf547f4f97f97e970f5ad645ee7601d55ff87afdfe76
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
  python setup.py test
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
