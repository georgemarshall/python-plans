pkg_name=pillow
pkg_distname=Pillow
pkg_version=4.1.0
pkg_origin=python2
pkg_license=('Standard PIL License')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python Imaging Library (Fork)"
pkg_upstream_url=https://python-pillow.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/p/pillow/${pkg_dirname}.tar.gz
pkg_shasum=a0fd487fed4a35717401b7566e51a1520b34e7c0f7f2a315a6509f82bc86299f
pkg_deps=(
  core/freetype
  core/lcms2
  core/libjpeg-turbo
  core/libtiff
  core/libwebp
  core/openjpeg
  core/zlib
  python2/python
  python2/setuptools
)
pkg_build_deps=(
  core/gcc
  python2/nose
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

do_begin() {
  add_path_env 'PYTHONPATH' 'lib/python2.7/site-packages'
}

do_build() {
  python setup.py build
}

#do_check() {
#  python setup.py test
#}

do_install() {
  python setup.py install \
    --prefix="$pkg_prefix" \
    --old-and-unmanageable # bypass egg install
}

do_strip() {
  do_default_strip

  # Remove tests and bytecode files
  find "$pkg_prefix" -depth \
    \( \
      \( -type d -a -name test -o -name tests \) \
      -o \
      \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
    \) -exec rm -rf '{}' +
}
