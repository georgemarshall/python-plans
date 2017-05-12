pkg_name=pyyaml
pkg_distname=PyYAML
pkg_version=3.12
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="YAML parser and emitter for Python"
pkg_upstream_url=http://pyyaml.org/wiki/PyYAML
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pyyaml/${pkg_dirname}.tar.gz
pkg_shasum=592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab
pkg_deps=(
  core/libyaml
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

  python setup.py --with-libyaml build
}

do_check() {
  python setup.py test
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile
}
