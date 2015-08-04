#!/bin/bash -ex
cd $(dirname $0)
if [ -d dollar ]
then
    rm -rf dollar
fi
git clone https://github.com/sillelien/dollar.git
cd dollar
if [ -n "$CIRCLE_BRANCH" ]
then
    echo "Building from $CIRCLE_BRANCH"
    git checkout $CIRCLE_BRANCH
else
    echo "Building from master"
    git checkout staging
fi

set -u
rm -rf ~/.dollar/typelearning.*
mvn clean install
cd -
./build-docs.sh
./pack/pack.sh
