#!/bin/bash -eu
cd $(dirname $0)
git clone https://github.com/sillelien/dollar.git
cd dollar
mvn clean install
./build-docs.sh
./pack/pack.sh
