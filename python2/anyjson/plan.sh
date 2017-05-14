pkg_name=anyjson
pkg_distname=${pkg_name}
pkg_version=0.3.3
pkg_origin=python2
pkg_license=('BSD-2-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Wraps the best available JSON implementation available in a common interface"
pkg_upstream_url=http://bitbucket.org/runeh/anyjson/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/a/anyjson/${pkg_dirname}.tar.gz
pkg_shasum=37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/nose
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
