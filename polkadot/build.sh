#!/usr/bin/env bash
set -e

# Find the current version from Cargo.toml
VERSION="0.2.0"
GITUSER=akagi201
GITREPO=polkadot

# Build the image
echo "Building ${GITREPO}:$VERSION docker image, hang on!"
time docker build --build-arg PROFILE=release -t ${GITUSER}/${GITREPO}:$VERSION .

# Show the list of available images for this repo
echo "Image is ready"
docker images | grep ${GITREPO}

echo -e "\nIf you just built the latest, you may want to update your tag:"
echo " $ docker tag ${GITUSER}/${GITREPO}:$VERSION ${GITUSER}/${GITREPO}:latest"
