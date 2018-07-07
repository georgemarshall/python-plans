#!/bin/bash -xe
export HAB_ORIGIN="${HAB_ORIGIN:-python}"
DO_UPLOAD="${DO_UPLOAD:-false}"

for dir in python appdirs pyparsing six packaging setuptools wheel pip; do
        cd $dir
        build
        source results/last_build.env
        if [ "${DO_UPLOAD}" != "false" ]; then
          # make sure you set HAB_AUTH_TOKEN to a valid token for this to work
          hab pkg upload results/$pkg_artifact --channel stable
        fi
        cd ..
done
