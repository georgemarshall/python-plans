pkg_name=pytest-runner
pkg_distname=${pkg_name}
pkg_version=2.11.1
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Invoke py.test as distutils command with dependency resolution"
pkg_upstream_url=https://github.com/pytest-dev/pytest-runner
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pytest-runner/${pkg_dirname}.tar.gz
pkg_shasum=983a31eab45e375240e250161a556163bc8d250edaba97960909338c273a89b3
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/pytest
  python2/setuptools
  python2/setuptools-scm
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

do_check() {
  pytest
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
