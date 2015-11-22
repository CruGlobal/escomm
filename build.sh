#!/bin/bash

bundle install --path vendor/bundle
rc=$?
if [ $rc -ne 0 ]; then
    echo -e "Bundle install failed"
    exit $rc
fi

bundle clean &&
cd app/assets &&
./build.sh &&
cd ../.. &&
docker build -t cruglobal/$PROJECT_NAME:$GIT_COMMIT-$BUILD_NUMBER .
