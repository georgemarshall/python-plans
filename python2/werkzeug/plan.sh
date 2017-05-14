pkg_name=werkzeug
pkg_distname=Werkzeug
pkg_version=0.12.1
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="The Swiss Army knife of Python web development"
pkg_upstream_url=http://werkzeug.pocoo.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/w/werkzeug/${pkg_dirname}.tar.gz
pkg_shasum=6716830febe9808bb7521fd26db3b398450cbed0886b2b4bea678b87340f534e
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/pytest
  # circular dep
  # python2/requests
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

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
