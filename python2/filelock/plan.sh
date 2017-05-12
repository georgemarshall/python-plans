pkg_name=filelock
pkg_distname=${pkg_name}
pkg_version=2.0.8
pkg_origin=python2
pkg_license=('Unlicense')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A platform independent file lock."
pkg_upstream_url=https://github.com/benediktschmitt/py-filelock
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/f/filelock/${pkg_dirname}.tar.gz
pkg_shasum=7e48e4906de3c9a5d64d8f235eb3ae1050dfefa63fd65eaf318cc915c935212b
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
