pkg_name=urllib3
pkg_distname=${pkg_name}
pkg_version=1.21.1
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="HTTP library with thread-safe connection pooling, file post, and more."
pkg_upstream_url=https://github.com/shazow/urllib3
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/u/urllib3/${pkg_dirname}.tar.gz
pkg_shasum=b14486978518ca0901a76ba973d7821047409d7f726f22156b24e83fd71382a5
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/mock
  python2/nose
  python2/psutil
  python2/setuptools
  python2/tornado

  # extra - secure
  python2/pyopenssl

  #extra - socks
  python2/pysocks
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

#do_check() {
#  nosetests
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
