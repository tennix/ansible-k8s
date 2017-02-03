#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

if [[ $# != 2 ]]; then
    echo "Usage:
    $0 <image_tar_path> <image_fulle_name>
    "
    exit 0
fi

image_tar=$1
image_tag=$2

if [ $(docker images "${image_tag}" | wc -l) -lt 2 ]; then
    echo "${image_tag} not exist"
    docker load -i "${image_tar}"
else
    echo "${image_tag} already exist"
fi
