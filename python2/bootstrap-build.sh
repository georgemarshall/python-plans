#!/bin/bash -xe
export HAB_ORIGIN="${HAB_ORIGIN:-python2}"
DO_UPLOAD="${DO_UPLOAD:-false}"
DO_BUILD="${DO_BUILD:-true}"

for dir in python appdirs pyparsing six packaging setuptools wheel pip; do
  cd $dir
  if [ "${DO_BUILD}" == "true" ]; then
    build
  fi

  if [ "${DO_UPLOAD}" == "true" ]; then
    source results/last_build.env
    # make sure you set HAB_AUTH_TOKEN to a valid token for this to work
    hab pkg upload results/$pkg_artifact --channel stable
  fi
  cd ..
done
