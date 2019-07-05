pkg_name=setuptools
pkg_version=41.0.1
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Easily download, build, install, upgrade, and uninstall \
Python packages"
pkg_upstream_url=https://github.com/pypa/setuptools
pkg_source=https://pypi.org/packages/source/s/setuptools/${pkg_dirname}.zip
pkg_shasum=a222d126f5471598053c9a77f4b5d4f26eaa1f150ad6e01dcf1a42e185d05613
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/appdirs
  $pkg_origin/packaging
  $pkg_origin/six
)
pkg_bin_dirs=(bin)
