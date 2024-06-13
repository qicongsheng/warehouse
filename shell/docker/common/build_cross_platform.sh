#!/bin/bash
IMG_NAME=$1
IMG_VERSION=$2
IMG_FULL_NAME_PLATFORM_AMD64="${IMG_NAME}:${IMG_VERSION}_amd64"
IMG_FULL_NAME_PLATFORM_ARM64="${IMG_NAME}:${IMG_VERSION}_arm64"

docker buildx build -t ghcr.io/qicongsheng/$IMG_FULL_NAME_PLATFORM_AMD64 --platform linux/amd64 . --push
docker buildx build -t ghcr.io/qicongsheng/$IMG_FULL_NAME_PLATFORM_ARM64 --platform linux/arm64 . --push
docker pull --platform=amd64 ghcr.io/qicongsheng/$IMG_FULL_NAME_PLATFORM_AMD64
docker pull --platform=arm64 ghcr.io/qicongsheng/$IMG_FULL_NAME_PLATFORM_ARM64
docker manifest create ghcr.io/qicongsheng/$IMG_NAME:$IMG_VERSION ghcr.io/qicongsheng/$IMG_FULL_NAME_PLATFORM_AMD64 ghcr.io/qicongsheng/$IMG_FULL_NAME_PLATFORM_ARM64
docker manifest push ghcr.io/qicongsheng/$IMG_NAME:$IMG_VERSION

docker buildx build -t registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME_PLATFORM_AMD64 --platform linux/amd64 . --push
docker buildx build -t registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME_PLATFORM_ARM64 --platform linux/arm64 . --push
docker pull --platform=amd64 registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME_PLATFORM_AMD64
docker pull --platform=arm64 registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME_PLATFORM_ARM64
docker manifest create registry.cn-hangzhou.aliyuncs.com/qics/$IMG_NAME:$IMG_VERSION registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME_PLATFORM_AMD64 registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME_PLATFORM_ARM64
docker manifest push registry.cn-hangzhou.aliyuncs.com/qics/$IMG_NAME:$IMG_VERSION

docker rmi ghcr.io/qicongsheng/$IMG_FULL_NAME_PLATFORM_AMD64
docker rmi ghcr.io/qicongsheng/$IMG_FULL_NAME_PLATFORM_ARM64
docker rmi registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME_PLATFORM_AMD64
docker rmi registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME_PLATFORM_ARM64