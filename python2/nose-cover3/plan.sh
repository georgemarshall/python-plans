pkg_name=nose-cover3
pkg_distname=${pkg_name}
pkg_version=0.1.0
pkg_origin=python2
pkg_license=('LGPL-2.1')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Coverage 3.x support for Nose"
pkg_upstream_url=http://github.com/ask/nosecover3
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/n/nose-cover3/${pkg_dirname}.tar.gz
pkg_shasum=81310a792285615418e749f6e7c60a4f2cfa6b2f13cf0d19bbf26b1f188444d1
pkg_deps=(
  python2/python
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
