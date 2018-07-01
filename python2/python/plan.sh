pkg_name=python
pkg_distname=Python
pkg_version=2.7.15
pkg_origin="${HAB_ORIGIN:-python2}"
pkg_license=('Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python is a programming language that lets you work quickly \
and integrate systems more effectively."
pkg_upstream_url=https://www.python.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://www.python.org/ftp/python/${pkg_version}/${pkg_dirname}.tgz
pkg_shasum=18617d1f15a380a919d517630a9cd85ce17ea602f9bbdc58ddc672df4b0239db
pkg_deps=(
  core/bzip2
  core/gcc-libs
  core/gdbm
  core/glibc
  core/ncurses
  core/openssl
  core/readline
  core/sqlite
  core/zlib
)
pkg_build_deps=(
  core/coreutils
  core/diffutils
  core/gcc
  core/gdb
  core/linux-headers
  core/make
  core/util-linux
)
pkg_lib_dirs=(lib)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_interpreters=(bin/python bin/python2 bin/python2.7)

do_prepare() {
  sed -i.bak 's/#zlib/zlib/' Modules/Setup.dist
  sed -i -re "/(SSL=|_ssl|-DUSE_SSL|-lssl).*/ s|^#||" Modules/Setup.dist
}

do_setup_environment() {
   set_buildtime_env PYTHON_SITE_PACKAGES "lib/python${pkg_version%.*}/site-packages"
}

do_build() {
  ./configure --prefix="$pkg_prefix" \
    --enable-shared \
    --enable-unicode=ucs4 \
    --without-ensurepip
  make
}

do_check() {
  # disable test_locale because string are unicode and TestStringMethods does
  # not expect this, even though the behavior is correct.
  export EXTRATESTOPTS='-x test_locale'
  make quicktest
}

do_strip() {
  do_default_strip

  # Remove bytecode files
  find . -type f -name '*.py[co]' -delete
}
