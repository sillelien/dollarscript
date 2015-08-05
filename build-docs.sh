#!/bin/bash -eux
cd $(dirname $0)
cd dollar
DIR=$(pwd)
[ ! -d dist ] || rm -rf dist
mkdir dist
cd dist
git clone git@github.com:sillelien/dollarscript.git docs
cd docs
git checkout gh-pages
cd $DIR/dollar-docs/src/main/webapp/
jekyll build
[ -d $DIR/dist/docs/dev ] || mkdir -p $DIR/dist/docs/dev
cp -rf $DIR/target/staging/* $DIR/dist/docs/dev
cp -rf * $DIR/dist/docs
cd $DIR
#mvn -q install exec:java -e -pl com.sillelien:dollar-docs -Dexec.mainClass="com.sillelien.dollar.docs.ParseDocs" -Dexec.args="./dist/docs"
cd dist/docs
git add *
git commit -a -m "Docs for release ${release:-snapshot}"  || :
git push || :
cd -

