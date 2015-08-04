#!/bin/bash -eu
cd $(dirname $0)/..

#mv ../dist/dollar.tgz ../dist/dollar-${1}-${2}.tgz
aws s3 cp dollar/dist/dollar.tgz s3://sillelien-maven-repo/dist/dollar/dollar-${release:-snapshot}.tgz
