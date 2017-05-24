pkg_name=uwsgi
pkg_distname=${pkg_name}
pkg_version=2.0.15
pkg_origin=python
pkg_license=('GPL-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="The uWSGI server"
pkg_upstream_url=http://projects.unbit.it/uwsgi
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/u/uwsgi/${pkg_dirname}.tar.gz
pkg_shasum=572ef9696b97595b4f44f6198fe8c06e6f4e6351d930d22e5330b071391272ff
pkg_deps=(
  core/pcre
  python/python
  python/setuptools
)
pkg_build_deps=(
  core/gcc
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

do_build() {
  python setup.py build
}

do_check() {
  # Sadly the test suite does not work with python3
  #python setup.py test
  return 0
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
