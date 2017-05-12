pkg_name=exam
pkg_distname=${pkg_name}
pkg_version=0.10.6
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Helpers for better testing."
pkg_upstream_url=https://github.com/fluxx/exam
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/e/exam/${pkg_dirname}.tar.gz
pkg_shasum=0c2da07ebc1c7b292721b0585bd43b282c7bb3287d33805e9934166f73e11789
pkg_deps=(
  python2/python
  python2/mock
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
  python setup.py nosetests
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
