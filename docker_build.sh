#!/bin/bash

# Build base image for building applications based on the Drogon framework.
#
# Usage: ./docker_build.sh alpine_version drogon_version trantor_version revision
# Example: ./docker_build.sh 3.23.0 1.9.11 1.5.24 1
#

docker login && docker build --build-arg alpine_version=$1 --build-arg drogon_version=$2 \
--build-arg trantor_version=$3 -f Dockerfile --provenance "mode=max" --sbom=true --no-cache \
--push -t slacktomcat/alpine_drogon:$1-$2-$3-$4 .
