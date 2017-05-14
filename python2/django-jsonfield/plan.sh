pkg_name=django-jsonfield
pkg_distname=${pkg_name}
pkg_version=1.0.1
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A reusable Django field that allows you to store validated \
JSON in your model."
pkg_upstream_url=https://github.com/bradjasper/django-jsonfield/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/d/django-jsonfield/${pkg_dirname}.tar.gz
pkg_shasum=6c0afd5554739365b55d86e285cf966cc3a45682fff963463364ea1f6511ca3e
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
