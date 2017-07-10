#!/bin/bash -ex
cd $(dirname $0)
if [ ! -d dollar ]
then
    git clone https://github.com/sillelien/dollar.git
fi
cd dollar
if [ -n "$CIRCLE_BRANCH" ]
then
    echo "Building from $CIRCLE_BRANCH"
    git checkout $CIRCLE_BRANCH
else
    echo "Building from master"
    git checkout master
fi
git pull
./build.sh
cd -
cd windows
docker build -t  sillelien-docker-docker.bintray.io/dollarscript-windows:${RELEASE:-dev}
cd -
cd headless
docker build -t  sillelien-docker-docker.bintray.io/dollarscript-headless:${RELEASE:-dev}
cd -
