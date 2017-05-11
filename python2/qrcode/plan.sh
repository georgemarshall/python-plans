pkg_name=qrcode
pkg_distname=${pkg_name}
pkg_version=5.3
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="QR Code image generator"
pkg_upstream_url=https://github.com/lincolnloop/python-qrcode
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/q/qrcode/${pkg_dirname}.tar.gz
pkg_shasum=4115ccee832620df16b659d4653568331015c718a754855caf5930805d76924e
pkg_deps=(
  python2/python
  python2/six
)
pkg_build_deps=(
  python2/mock
  python2/pbr
  python2/pillow
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

do_check() {
  python setup.py test --test-suite qrcode.tests
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
