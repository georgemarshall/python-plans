pkg_name=pytz
pkg_version=2017.2
pkg_origin="${HAB_ORIGIN:-python}"
pkg_license=('MIT')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="World timezone definitions, modern and historical"
pkg_upstream_url=http://pythonhosted.org/pytz
pkg_source=https://pypi.org/packages/source/p/pytz/${pkg_dirname}.zip
pkg_shasum=f5c056e8f62d45ba8215e5cb8f50dfccb198b4b9fbea8500674f3443e4689589
pkg_deps=( $pkg_origin/python )

source ../python-plan-base.sh
