pkg_name=gunicorn
pkg_distname=${pkg_name}
pkg_version=19.7.1
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="WSGI HTTP Server for UNIX"
pkg_upstream_url=http://gunicorn.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/g/gunicorn/${pkg_dirname}.tar.gz
pkg_shasum=eee1169f0ca667be05db3351a0960765620dad53f53434262ff8901b68a1b622
pkg_deps=(
  python2/python
  python2/setuptools
)
pkg_build_deps=(
  core/patch
  python2/mock
  python2/pytest
  python2/pytest-cov
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

do_prepare() {
  patch -p0 -i "$PLAN_CONTEXT/setup.patch"
}

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
