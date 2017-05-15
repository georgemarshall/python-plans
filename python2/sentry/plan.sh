pkg_name=sentry
pkg_distname=${pkg_name}
pkg_version=8.16.0
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A realtime logging and aggregation server."
pkg_upstream_url=http://github.com/getsentry/symsynd
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/s/sentry/${pkg_dirname}.tar.gz
pkg_shasum=83e7248889f76473662b55e7b55d667eb9e0e5baf00ea0ebc197bbeb24767676
pkg_deps=(
  python2/python
  python2/boto3
  python2/celery3
  python2/click
  python2/cssutils
  python2/django16
  python2/django-crispy-forms15
  python2/django-debug-toolbar13
  python2/django-jsonfield0
  python2/django-picklefield
  python2/django-sudo
  python2/django-templatetag-sugar
  python2/djangorestframework2
  python2/email-reply-parser
  python2/enum34
  python2/exam
  python2/hiredis
  python2/honcho
  python2/ipaddress
  python2/kombu
  python2/libsourcemap
  python2/loremipsum
  python2/lxml
  python2/mmh3
  python2/mock
  python2/oauth2
  python2/percy
  python2/petname
  python2/pillow
  python2/progressbar2
  python2/psycopg2
  python2/pytest
  python2/pytest-django
  python2/pytest-html
  python2/python-dateutil
  python2/python-memcached
  python2/python-openid
  python2/python-u2flib-server
  python2/pyyaml
  python2/qrcode
  python2/raven
  python2/rb
  python2/redis
  python2/requests
  python2/selenium
  python2/setproctitle
  python2/setuptools
  python2/simplejson
  python2/six
  python2/south
  python2/statsd
  python2/structlog
  python2/symsynd
  python2/toronado
  python2/ua-parser
  python2/urllib3
  python2/uwsgi
)
pkg_build_deps=(
  core/patch
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)
pkg_bin_dirs=(bin)

do_prepare() {
  patch -p0 -i "$PLAN_CONTEXT/setup.patch"
}

do_build() {
  python setup.py build
}

do_install() {
  add_path_env 'PYTHONPATH' "$PYTHON_SITE_PACKAGES"
  python setup.py install \
    --prefix="$pkg_prefix" \
    --no-compile \
    --old-and-unmanageable # bypass egg install
}
