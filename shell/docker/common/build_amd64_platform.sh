#!/bin/bash
IMG_FULL_NAME=$1
docker build -t ghcr.io/qicongsheng/$IMG_FULL_NAME_amd64 . --push
docker pull ghcr.io/qicongsheng/$IMG_FULL_NAME_amd64
docker manifest create ghcr.io/qicongsheng/$IMG_FULL_NAME ghcr.io/qicongsheng/$IMG_FULL_NAME_amd64
docker manifest push ghcr.io/qicongsheng/$IMG_FULL_NAME

docker build -t registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME_amd64 . --push
docker pull registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME_amd64
docker manifest create registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME ghcr.io/qicongsheng/$IMG_FULL_NAME_amd64
docker manifest push registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME

