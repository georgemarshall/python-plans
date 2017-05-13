pkg_name=setuptools-scm
pkg_distname=setuptools_scm
pkg_version=1.15.5
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="the blessed package to manage your versions by scm tags"
pkg_upstream_url=https://github.com/pypa/setuptools_scm/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/s/setuptools-scm/${pkg_dirname}.tar.gz
pkg_shasum=145b2a8a609e0fd66108a92a06fe62d0fb329c0eb944f2d5c7ae3ca24222f29e
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/pytest
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

#do_check() {\
#  export PYTHONPATH="$PWD/build/lib:$PYTHONPATH"
#  pytest
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
