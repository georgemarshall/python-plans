pkg_name=s3transfer
pkg_distname=${pkg_name}
pkg_version=0.1.10
pkg_origin=python2
pkg_license=('Apache-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="An Amazon S3 Transfer Manager"
pkg_upstream_url=https://github.com/boto/s3transfer
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/s/s3transfer/${pkg_dirname}.tar.gz
pkg_shasum=ba1a9104939b7c0331dc4dd234d79afeed8b66edce77bbeeecd4f56de74a0fc1
pkg_deps=(
  python2/python
  python2/botocore
  python2/futures
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
