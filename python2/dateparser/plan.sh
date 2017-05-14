pkg_name=dateparser
pkg_distname=${pkg_name}
pkg_version=0.6.0
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Date parsing library designed to parse dates from HTML pages"
pkg_upstream_url=https://github.com/scrapinghub/dateparser
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/d/dateparser/${pkg_dirname}.tar.gz
pkg_shasum=f8c24317120b06f71691d28076764ec084a132be2a250a78fdf54f6b427cac95
pkg_deps=(
  python2/python
  python2/python-dateutil
  python2/pytz
  python2/regex
  python2/ruamel-yaml
  python2/six
  python2/tzlocal
)
pkg_build_deps=(
  python2/coverage
  python2/mock
  python2/nose
  python2/nose-parameterized
  python2/ruamel-ordereddict
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

# UnknownTimeZoneError: 'Can not find any timezone configuration'
#do_check() {
#  python setup.py test
#}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
