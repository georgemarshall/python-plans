pkg_name=ipaddress
pkg_distname=${pkg_name}
pkg_version=1.0.18
pkg_origin=python2
pkg_license=('Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="IPv4/IPv6 manipulation library"
pkg_upstream_url=https://github.com/phihag/ipaddress
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/i/ipaddress/${pkg_dirname}.tar.gz
pkg_shasum=5d8534c8e185f2d8a1fda1ef73f2c8f4b23264e8e30063feeb9511d492a413e1
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
