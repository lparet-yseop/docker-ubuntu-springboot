#!/bin/bash
set -e

source version.sh

echo "Execute : docker push ${REGISTRY}/${IMAGE}"
docker push ${REGISTRY}/${IMAGE}