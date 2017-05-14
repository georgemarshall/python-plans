pkg_name=botocore
pkg_distname=${pkg_name}
pkg_version=1.5.48
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Low-level, data-driven core of boto 3."
pkg_upstream_url=https://github.com/boto/botocore
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/b/botocore/${pkg_dirname}.tar.gz
pkg_shasum=56015c83e03241a536a14fec9ffb3a533eb7255a169c0ea6ca3e9ba5399a44b2
pkg_deps=(
  python2/python
  python2/docutils
  python2/jmespath
  python2/python-dateutil
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
