pkg_name=urllib3116
pkg_distname=urllib3
pkg_version=1.16
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="HTTP library with thread-safe connection pooling, file post, and more."
pkg_upstream_url=https://github.com/shazow/urllib3
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/u/urllib3/${pkg_dirname}.tar.gz
pkg_shasum=63d479478ddfc83bbc11577dc16d47835c5179ac13e550118ca143b62c4bf9ab
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
