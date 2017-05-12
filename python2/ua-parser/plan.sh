pkg_name=ua-parser
pkg_distname=${pkg_name}
pkg_version=0.7.3
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python port of Browserscope's user agent parser"
pkg_upstream_url=https://github.com/ua-parser/uap-python
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/u/ua-parser/${pkg_dirname}.tar.gz
pkg_shasum=0aafb05a67b621eb4d69f6c1c3972f2d9443982bcd9132a8b665d90cd48a1add
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/pyyaml
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

#do_check() {
#  python ua_parser/user_agent_parser_test.py
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
