pkg_name=regex
pkg_distname=${pkg_name}
pkg_version=2017.04.29
pkg_origin=python2
pkg_license=('Python-2.0')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Alternative regular expression module, to replace re."
pkg_upstream_url=https://bitbucket.org/mrabarnett/mrab-regex
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/r/regex/${pkg_dirname}.tar.gz
pkg_shasum=9a010528e9a55ab32c7b5e6b4400466e727f7bb4e33810dd8ba9fab377918e37
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  core/gcc
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

do_check() {
  export PYTHONPATH="$PWD/build/lib.linux-x86_64-2.7:$PYTHONPATH"
  python -m test_regex

  # Remove bytecode files
  find . -type f -name '*.py[co]' -delete
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
