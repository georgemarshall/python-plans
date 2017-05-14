pkg_name=nose-parameterized
pkg_distname=${pkg_name}
pkg_version=0.6.0
pkg_origin=python2
pkg_license=('BSD-2-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Parameterized testing with any Python test framework \
(DEPRECATED; See the 'parameterized' package)"
pkg_upstream_url=https://github.com/wolever/parameterized
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/n/nose-parameterized/${pkg_dirname}.tar.gz
pkg_shasum=d35e677aba2f15135b6b7ea7feb88f792b899492ba5365ec0e269015df5214ce
pkg_deps=(
  python2/python
)
pkg_build_deps=(
  python2/nose
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_build_env=(
  ['NOSE_PARAMETERIZED_NO_WARN']=1
)

do_build() {
  python setup.py build
}

# UnicodeEncodeError: 'ascii' codec can't encode character u'\xf6' in position 89: ordinal not in range(128)
#do_check() {
#  python setup.py test --test-suite nose_parameterized.test
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
