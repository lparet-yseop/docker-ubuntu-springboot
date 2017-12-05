#!/bin/bash
set -e

source version.sh

echo "Execute : docker build --no-cache -t ${REGISTRY}/${IMAGE} . "
docker build -t ${REGISTRY}/${IMAGE} .