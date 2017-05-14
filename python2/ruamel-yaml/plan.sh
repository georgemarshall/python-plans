pkg_name=ruamel-yaml
pkg_distname=ruamel.yaml
pkg_version=0.14.11
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="ruamel.yaml is a YAML parser/emitter that supports roundtrip \
preservation of comments, seq/map flow style, and map key order"
pkg_upstream_url=https://bitbucket.org/ruamel/yaml
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/r/ruamel.yaml/${pkg_dirname}.tar.gz
pkg_shasum=d35710b0aec7fbc0582042b63c70ba5b760a75ff8e950395757c15a3e893275b
pkg_deps=(
  python2/python
  python2/setuptools
)
pkg_build_deps=(
  core/gcc
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_prepare() {
  export RUAMEL_NO_PIP_INSTALL_CHECK=1
}

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
