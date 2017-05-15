pkg_name=mmh3
pkg_distname=${pkg_name}
pkg_version=2.3.1
pkg_origin=python2
pkg_license=('Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python wrapper for MurmurHash (MurmurHash3), a set of fast \
and robust hash functions."
pkg_upstream_url=http://packages.python.org/mmh3
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/m/mmh3/${pkg_dirname}.tar.gz
pkg_shasum=ecadc3557c093211a70b49814cf91d6833fff403edf2d8405645e227262de928
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  core/gcc
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
