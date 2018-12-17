pkg_name=python
pkg_distname=Python
pkg_version=3.7.1
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python is a programming language that lets you work quickly \
and integrate systems more effectively."
pkg_upstream_url=https://www.python.org/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://www.python.org/ftp/python/${pkg_version}/${pkg_dirname}.tgz
pkg_shasum=36c1b81ac29d0f8341f727ef40864d99d8206897be96be73dc34d4739c9c9f06
pkg_deps=(
  core/bzip2
  core/expat
  core/gcc-libs
  core/gdbm
  core/glibc
  core/libffi
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
pkg_interpreters=(bin/python bin/python3 bin/python3.7)
do_setup_environment() {
   set_buildtime_env PYTHON_SITE_PACKAGES "lib/python${pkg_version%.*}/site-packages"
}

do_prepare() {
  sed -i.bak 's/#zlib/zlib/' Modules/Setup.dist
  sed -i -re "/(SSL=|_ssl|-DUSE_SSL|-lssl).*/ s|^#||" Modules/Setup.dist
}

do_build() {
  export LDFLAGS="$LDFLAGS -lgcc_s"
  ./configure --prefix="$pkg_prefix" \
              --enable-loadable-sqlite-extensions \
              --with-openssl=$(pkg_path_for openssl) \
              --enable-shared \
              --with-system-expat \
              --with-system-ffi \
              --without-ensurepip
              # --enable-optimizations # NOTE: this adds about 30 minutes to the build time

  make --jobs="$(nproc)"
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

  # Remove bytecode files
  find . -type f -name '*.py[co]' -delete
}
