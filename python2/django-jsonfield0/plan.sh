pkg_name=django-jsonfield0
pkg_distname=django-jsonfield
pkg_version=0.9.19
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A reusable Django field that allows you to store validated \
JSON in your model."
pkg_upstream_url=http://bitbucket.org/schinckel/django-jsonfield/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/d/django-jsonfield/${pkg_dirname}.tar.gz
pkg_shasum=3df19d80029f1c20ad728e3d900326797603abecec8ec45694fe0c246f301321
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
