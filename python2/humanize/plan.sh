pkg_name=humanize
pkg_distname=${pkg_name}
pkg_version=0.5.1
pkg_origin=python2
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="python humanize utilities"
pkg_upstream_url=http://github.com/jmoiron/humanize
pkg_dirname=${pkg_distname}-${pkg_version}
pkg_source=https://pypi.org/packages/source/h/humanize/${pkg_dirname}.tar.gz
pkg_shasum=a43f57115831ac7c70de098e6ac46ac13be00d69abbf60bdcac251344785bb19
pkg_deps=(
  python2/python
)
pkg_build_deps=(
#  python2/mock
  python2/setuptools
)
pkg_env_sep=(
  ['PYTHONPATH']=':'
)

do_build() {
  python setup.py build
}

# Tests not included in source release
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
