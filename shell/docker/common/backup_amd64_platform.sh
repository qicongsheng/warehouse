#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/common/backup_amd64_platform.sh | /bin/sh
REGISTRY_URI=$1
IMG_NAME=$2
IMG_VERSION=$3
IMG_FULL_NAME_PLATFORM_AMD64="${IMG_NAME}:${IMG_VERSION}_amd64"
IMG_TAR_NAME_AMD64="${IMG_NAME}_${IMG_VERSION}_amd64.tar"

rm -fr /tmp/img_bak/$IMG_NAME
mkdir -p /tmp/img_bak/$IMG_NAME

docker pull $REGISTRY_URI/$IMG_FULL_NAME_PLATFORM_AMD64

docker save $REGISTRY_URI/$IMG_FULL_NAME_PLATFORM_AMD64 > /tmp/$IMG_NAME/$IMG_TAR_NAME_AMD64

docker rmi $REGISTRY_URI/$IMG_FULL_NAME_PLATFORM_AMD64

