pkg_name=pip
pkg_version=19.1.1
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="The PyPA recommended tool for installing Python packages."
pkg_upstream_url=https://pip.pypa.io/
pkg_source=https://pypi.org/packages/source/p/pip/${pkg_dirname}.tar.gz
pkg_shasum=44d3d7d3d30a1eb65c7e5ff1173cdf8f7467850605ac7cc3707b6064bddd0958
pkg_deps=(
  $pkg_origin/python
  $pkg_origin/setuptools
  $pkg_origin/wheel
)
pkg_bin_dirs=(bin)
