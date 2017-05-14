pkg_name=boto3
pkg_distname=${pkg_name}
pkg_version=1.4.4
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="The AWS SDK for Python"
pkg_upstream_url=https://github.com/boto/boto3
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/b/boto3/${pkg_dirname}.tar.gz
pkg_shasum=518f724c4758e5a5bed114fbcbd1cf470a15306d416ff421a025b76f1d390939
pkg_deps=(
  python2/python
  python2/botocore
  python2/jmespath
  python2/s3transfer
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
