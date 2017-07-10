#!/bin/bash -ex
RELEASE=$(cat .release)
docker login -u neilellis -p ${BINTRAY_API_KEY} -e hello@sillelien.com sillelien-docker-docker.bintray.io
docker push sillelien-docker-docker.bintray.io/dollarscript:${RELEASE:-dev}-windows
docker push sillelien-docker-docker.bintray.io/dollarscript:${RELEASE:-dev}-headless
