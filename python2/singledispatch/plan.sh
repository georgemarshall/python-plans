pkg_name=singledispatch
pkg_distname=${pkg_name}
pkg_version=3.4.0.3
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="This library brings functools.singledispatch from Python 3.4 \
to Python 2.6-3.3."
pkg_upstream_url=https://github.com/ambv/singledispatch/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/s/singledispatch/${pkg_dirname}.tar.gz
pkg_shasum=5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e3c2b9c
pkg_deps=(
  python2/python
  python2/six
)
pkg_build_deps=(
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
