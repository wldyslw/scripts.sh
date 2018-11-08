#!/bin/bash
# Creates new parcel project in specified folder
# TODO: add some other options like installing additional packages

set -euo pipefail

PROJECT_PATH=$1
if [ ! -n "$PROJECT_PATH" ]; then
    while [ ! -n "$PROJECT_PATH" ]
    do
        echo -en "Specify the location for new parcel project: "
        read PROJECT_PATH
    done
fi

echo "Creating new parcel project..."
if [ ! -d "$PROJECT_PATH" ]; then
    mkdir $PROJECT_PATH || { echo "Specified path is invalid. Please, try again"; exit 1; }
fi
cd $PROJECT_PATH

yarn init -y
yarn add parcel-bundler

git init
touch .gitignore index.html index.js Readme.md
printf "node_modules/\n.cache\n" > .gitignore

echo "Parcel project successfully created"
