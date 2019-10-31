pkg_name=olefile
pkg_version=0.44
source ../python-plan-base.sh
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="Python package to parse, read and write Microsoft OLE2 \
files (Structured Storage or Compound Document, Microsoft Office) - Improved \
version of the OleFileIO module from PIL, the Python Image Library."
pkg_upstream_url=https://www.decalage.info/python/olefileio
pkg_source=https://pypi.org/packages/source/o/olefile/${pkg_dirname}.zip
pkg_shasum=61f2ca0cd0aa77279eb943c07f607438edf374096b66332fae1ee64a6f0f73ad
pkg_deps=(
  $pkg_origin/python
)
