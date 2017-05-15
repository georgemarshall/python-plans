pkg_name=python-openid
pkg_distname=${pkg_name}
pkg_version=2.2.5
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="OpenID support for servers and consumers."
pkg_upstream_url=http://github.com/openid/python-openid
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/python-openid/${pkg_dirname}.tar.gz
pkg_shasum=92c51c3ecec846cbec4aeff11f9ff47303d4a63f93b0e6ac0ec02a091fed70ef
pkg_deps=(
  python2/python
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
    --no-compile
}
