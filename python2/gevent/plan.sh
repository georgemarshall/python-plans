pkg_name=gevent
pkg_distname=${pkg_name}
pkg_version=1.2.1
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Coroutine-based network library"
pkg_upstream_url=http://www.gevent.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/g/gevent/${pkg_dirname}.tar.gz
pkg_shasum=3de300d0e32c31311e426e4d5d73b36777ed99c2bac3f8fbad939eeb2c29fa7c
pkg_deps=(
  python2/python
  python2/greenlet
)
pkg_build_deps=(
  core/diffutils
  core/file
  core/make
  python2/cffi
  python2/cython
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  unset CFLAGS
  python setup.py -v build
}

# Does not pass in studio
#do_check() {
#  export PYTHONPATH="$PWD/build/lib.linux-x86_64-2.7:$PYTHONPATH"
#  cd src/greentest && GEVENT_RESOLVER=thread python testrunner.py --config known_failures.py
#
#  # Remove bytecode files
#  find . -type f -name '*.py[co]' -delete
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
