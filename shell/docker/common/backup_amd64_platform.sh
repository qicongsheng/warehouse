#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/common/backup_amd64_platform.sh | /bin/sh
REGISTRY_SOURCE=$1
REGISTRY_TARGET=$2
IMG_NAME=$3
IMG_VERSION=$4
IMG_FULL_NAME_PLATFORM_AMD64="${IMG_NAME}:${IMG_VERSION}_amd64"

docker pull $REGISTRY_SOURCE/$IMG_FULL_NAME_PLATFORM_AMD64
docker tag $REGISTRY_SOURCE/$IMG_FULL_NAME_PLATFORM_AMD64 $REGISTRY_TARGET/$IMG_FULL_NAME_PLATFORM_AMD64

docker push $REGISTRY_TARGET/$IMG_FULL_NAME_PLATFORM_AMD64
docker manifest create $REGISTRY_TARGET/$IMG_NAME:$IMG_VERSION $REGISTRY_TARGET/$IMG_FULL_NAME_PLATFORM_AMD64
docker manifest push $REGISTRY_TARGET/$IMG_NAME:$IMG_VERSION

docker rmi $REGISTRY_SOURCE/$IMG_FULL_NAME_PLATFORM_AMD64
docker rmi $REGISTRY_TARGET/$IMG_FULL_NAME_PLATFORM_AMD64

