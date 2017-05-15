pkg_name=loremipsum
pkg_distname=${pkg_name}
pkg_version=1.0.5
pkg_origin=python2
pkg_license=('GPL-3.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A Lorem Ipsum text generator"
pkg_upstream_url=http://projects.monkeython.com/loremipsum
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/l/loremipsum/${pkg_dirname}.tar.gz
pkg_shasum=b849c69305c3f52badfe25ecc0495b991769d96cafdfd99014d17f50ee523af5
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

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
