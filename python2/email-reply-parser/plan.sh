pkg_name=email-reply-parser
pkg_distname=email_reply_parser
pkg_version=0.5.9
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Email reply parser"
pkg_upstream_url=https://github.com/zapier/email-reply-parser
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/e/email_reply_parser/${pkg_dirname}.tar.gz
pkg_shasum=f92aa6fd7314c2c8833f2928c0fd6d2e26f94c04eb1de409e75c59f1ac42eef8
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

# Test data is missing from the release package
#do_check() {
#  touch test/__init__.py
#  python setup.py test
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
