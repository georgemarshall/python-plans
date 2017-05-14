pkg_name=flask
pkg_distname=Flask
pkg_version=0.12.1
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A microframework based on Werkzeug, Jinja2 and good intentions"
pkg_upstream_url=http://github.com/pallets/flask/
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/f/flask/${pkg_dirname}.tar.gz
pkg_shasum=9dce4b6bfbb5b062181d3f7da8f727ff70c1156cbb4024351eafd426deb5fb88
pkg_deps=(
  python2/python
  python2/click
  python2/itsdangerous
  python2/jinja2
  python2/setuptools
  python2/werkzeug
)
pkg_build_deps=(
  python2/pytest
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

do_build() {
  python setup.py build
}

do_check() {
  export PYTHONPATH="$PWD/build/lib:$PWD/examples/flaskr:$PWD/examples/minitwit:$PYTHONPATH"
  pytest

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
