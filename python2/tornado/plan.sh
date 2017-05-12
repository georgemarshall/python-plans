pkg_name=tornado
pkg_distname=${pkg_name}
pkg_version=4.5.1
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Tornado is a Python web framework and asynchronous networking \
library, originally developed at FriendFeed."
pkg_upstream_url=http://www.tornadoweb.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/t/tornado/${pkg_dirname}.tar.gz
pkg_shasum=db0904a28253cfe53e7dedc765c71596f3c53bb8a866ae50123320ec1a7b73fd
pkg_deps=(
  python2/python
  python2/backports_abc
  python2/certifi
  python2/singledispatch
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

#do_check() {
#  python -m tornado.test.runtests
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
