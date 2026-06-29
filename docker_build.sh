#!/bin/bash

# Build base image for building applications based on the Drogon framework.
#
# Usage: ./docker_build.sh alpine_version drogon_version trantor_version revision
# Example: ./docker_build.sh 3.24.1 1.9.13 1.5.28 1
#

docker login && docker build --build-arg alpine_version=$1 --build-arg drogon_version=$2 \
--build-arg trantor_version=$3 -f Dockerfile --provenance "mode=max" --sbom=true --no-cache \
--push -t slacktomcat/alpine_drogon:$1-$2-$3-$4 .
