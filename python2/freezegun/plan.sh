pkg_name=freezegun
pkg_distname=${pkg_name}
pkg_version=0.3.9
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Let your Python tests travel through time"
pkg_upstream_url=https://github.com/spulec/freezegun
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/f/freezegun/${pkg_dirname}.tar.gz
pkg_shasum=783ccccd7f60968bfe49ad9e114c18ea2b63831faaaf61c1f1f71ddfde1c0eee
pkg_deps=(
  python2/python
  python2/python-dateutil
  python2/six
)
pkg_build_deps=(
  python2/mock
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
  nosetests ./tests/
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
