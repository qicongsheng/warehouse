#!/bin/bash
IMG_FULL_NAME=$1
IMG_FULL_NAME_PLATFORM="$IMG_FULL_NAME_amd64"
docker build -t ghcr.io/qicongsheng/IMG_FULL_NAME_PLATFORM . --push
docker pull ghcr.io/qicongsheng/IMG_FULL_NAME_PLATFORM
docker manifest create ghcr.io/qicongsheng/$IMG_FULL_NAME ghcr.io/qicongsheng/IMG_FULL_NAME_PLATFORM
docker manifest push ghcr.io/qicongsheng/$IMG_FULL_NAME

docker build -t registry.cn-hangzhou.aliyuncs.com/qics/IMG_FULL_NAME_PLATFORM . --push
docker pull registry.cn-hangzhou.aliyuncs.com/qics/IMG_FULL_NAME_PLATFORM
docker manifest create registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME ghcr.io/qicongsheng/IMG_FULL_NAME_PLATFORM
docker manifest push registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME

