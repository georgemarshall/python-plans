pkg_name=requests
pkg_distname=${pkg_name}
pkg_version=2.14.2
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python HTTP for Humans."
pkg_upstream_url=http://python-requests.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/r/requests/${pkg_dirname}.tar.gz
pkg_shasum=a274abba399a23e8713ffd2b5706535ae280ebe2b8069ee6a941cb089440d153
pkg_deps=(
  python2/python
  python2/cryptography
  python2/idna
  python2/pyopenssl
  python2/pysocks
)
pkg_build_deps=(
#  python2/pytest
#  python2/pytest-cov
#  python2/pytest-httpbin
#  python2/pytest-mock
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

# Tests not included in source release
#do_check() {
#  python setup.py test
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
