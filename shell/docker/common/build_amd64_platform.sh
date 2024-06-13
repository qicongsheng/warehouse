#!/bin/bash
IMG_NAME=$1
IMG_VERSION=$2
IMG_FULL_NAME_PLATFORM_AMD64="${IMG_NAME}:${IMG_VERSION}_amd64"

docker build -t ghcr.io/qicongsheng/$IMG_FULL_NAME_PLATFORM_AMD64 . --push
docker pull ghcr.io/qicongsheng/$IMG_FULL_NAME_PLATFORM_AMD64
docker manifest create ghcr.io/qicongsheng/$IMG_NAME:$IMG_VERSION ghcr.io/qicongsheng/$IMG_FULL_NAME_PLATFORM_AMD64
docker manifest push ghcr.io/qicongsheng/$IMG_NAME:$IMG_VERSION

docker build -t registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME_PLATFORM_AMD64 . --push
docker pull registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME_PLATFORM_AMD64
docker manifest create registry.cn-hangzhou.aliyuncs.com/qics/$IMG_NAME:$IMG_VERSION registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME_PLATFORM_AMD64
docker manifest push registry.cn-hangzhou.aliyuncs.com/qics/$IMG_NAME:$IMG_VERSION
