pkg_name=ruamel-ordereddict
pkg_distname=ruamel.ordereddict
pkg_version=0.4.9
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="a version of dict that keeps keys in insertion resp. sorted \
order"
pkg_upstream_url=https://bitbucket.org/ruamel/ordereddict
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/r/ruamel.ordereddict/${pkg_dirname}.tar.gz
pkg_shasum=7058c470f131487a3039fb9536dda9dd17004a7581bdeeafa836269a36a2b3f6
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  core/gcc
  python2/pytest
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
  cat <<EOF > "$PWD/build/lib.linux-x86_64-2.7/ruamel/__init__.py"
import pkg_resources
pkg_resources.declare_namespace(__name__)
EOF
}

do_check() {
  export PYTHONPATH="$PWD/build/lib.linux-x86_64-2.7:$PYTHONPATH"
  python test/testordereddict.py
  pytest test/test_ordereddict.py

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
