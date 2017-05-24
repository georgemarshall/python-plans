pkg_name=sentry-web
pkg_version=8.16.0
pkg_origin=python2
pkg_license=('BSD-3-Clause')
pkg_maintainer="George Marshall <george@georgemarshall.name>"
pkg_description="A realtime logging and aggregation server."
pkg_deps=(
  python2/sentry
)
pkg_binds=(
  [database]="port"
  [datastore]="port"
)

do_build() {
  return 0
}

do_install() {
  return 0
}
