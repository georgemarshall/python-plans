pkg_name=psutil
pkg_distname=${pkg_name}
pkg_version=5.2.2
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="psutil is a cross-platform library for retrieving \
information on running processes and system utilization (CPU, memory, disks, \
network)in Python."
pkg_upstream_url=https://github.com/giampaolo/psutil
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/psutil/${pkg_dirname}.tar.gz
pkg_shasum=44746540c0fab5b95401520d29eb9ffe84b3b4a235bd1d1971cbe36e1f38dd13
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  core/gcc
  python2/ipaddress
  python2/mock
  python2/setuptools
  python2/unittest2
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

#do_check() {
#  python setup.py test --test-suite psutil.tests
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
