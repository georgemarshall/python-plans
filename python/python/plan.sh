pkg_name=python
pkg_distname=Python
pkg_version=3.6.1
pkg_origin=python
pkg_license=('Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python is a programming language that lets you work quickly \
and integrate systems more effectively."
pkg_upstream_url=https://www.python.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://www.python.org/ftp/python/${pkg_version}/${pkg_dirname}.tgz
pkg_shasum=aa50b0143df7c89ce91be020fe41382613a817354b33acdc6641b44f8ced3828
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
pkg_build_env=(
  ['PYTHON_SITE_PACKAGES']="lib/python${pkg_version%.*}/site-packages"
)
pkg_lib_dirs=(lib)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_interpreters=(bin/python bin/python3 bin/python3.6)

do_prepare() {
  sed -i.bak 's/#zlib/zlib/' Modules/Setup.dist
  sed -i -re "/(SSL=|_ssl|-DUSE_SSL|-lssl).*/ s|^#||" Modules/Setup.dist
}

do_build() {
  export LDFLAGS="$LDFLAGS -lgcc_s"
  ./configure --prefix="$pkg_prefix" \
    --enable-loadable-sqlite-extensions \
    --enable-shared \
    --without-ensurepip
  make
}

do_check() {
  # disable test_asyncio because BaseEventLoopWithSelectorTests does not play
  # nicely with thread context switching.
  export EXTRATESTOPTS='-x test_asyncio'
  make quicktest
}

do_install() {
  do_default_install

  # link pythonx.x to python for pkg_interpreters
  local v=${pkg_version%.*}
  ln -rs "$pkg_prefix/bin/pip$v" "$pkg_prefix/bin/pip"
  ln -rs "$pkg_prefix/bin/pydoc$v" "$pkg_prefix/bin/pydoc"
  ln -rs "$pkg_prefix/bin/python$v" "$pkg_prefix/bin/python"
  ln -rs "$pkg_prefix/bin/python$v-config" "$pkg_prefix/bin/python-config"
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
