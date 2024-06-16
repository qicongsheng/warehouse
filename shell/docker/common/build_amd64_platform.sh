#!/bin/bash
IMG_NAME=$1
IMG_VERSION=$2
IMG_FULL_NAME_PLATFORM_AMD64="${IMG_NAME}:${IMG_VERSION}_amd64"

docker build -t ghcr.io/qicongsheng/$IMG_FULL_NAME_PLATFORM_AMD64 . --load
docker push ghcr.io/qicongsheng/$IMG_FULL_NAME_PLATFORM_AMD64
docker manifest create ghcr.io/qicongsheng/$IMG_NAME:$IMG_VERSION ghcr.io/qicongsheng/$IMG_FULL_NAME_PLATFORM_AMD64 --amend
docker manifest push ghcr.io/qicongsheng/$IMG_NAME:$IMG_VERSION

curl -fsSL https://www.qics.top/shell/docker/common/img_amd64_sync.sh | /bin/sh -s "ghcr.io/qicongsheng" "registry.cn-hangzhou.aliyuncs.com/qics" $IMG_NAME $IMG_VERSION

docker rmi ghcr.io/qicongsheng/$IMG_FULL_NAME_PLATFORM_AMD64
docker rmi registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME_PLATFORM_AMD64
