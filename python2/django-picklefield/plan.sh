pkg_name=django-picklefield
pkg_distname=${pkg_name}
pkg_version=0.3.2
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Pickled object field for Django"
pkg_upstream_url=http://github.com/gintas/django-picklefield
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/d/django-picklefield/${pkg_dirname}.tar.gz
pkg_shasum=fab48a427c6310740755b242128f9300283bef159ffee42d3231a274c65d9ae2
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
