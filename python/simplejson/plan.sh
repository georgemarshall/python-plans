pkg_name=simplejson
pkg_version=3.10.0
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT' 'AFL-2.1')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Simple, fast, extensible JSON encoder/decoder for Python"
pkg_upstream_url=http://github.com/simplejson/simplejson
pkg_source=https://pypi.org/packages/source/s/simplejson/${pkg_dirname}.tar.gz
pkg_shasum=953be622e88323c6f43fad61ffd05bebe73b9fd9863a46d68b052d2aa7d71ce2
pkg_deps=(
  $pkg_origin/python
)
pkg_build_deps=(
  core/gcc
  $pkg_origin/setuptools
)

do_check() {
  python setup.py test
}

source ../python-plan-base.sh
