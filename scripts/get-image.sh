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

if [[ ! -f "${image_tar}" ]]; then
    if [ $(docker images "${image_tag}" | wc -l) -lt 2 ]; then
	docker pull "${image_tag}"
	docker save -o "${image_tar}" "${image_tag}"
    else
	docker save -o "${image_tar}" "${image_tag}"
    fi
else
    echo "${image_tar} already exist"
fi
