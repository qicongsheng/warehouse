#!/bin/bash
IMG_FULL_NAME=$1
docker buildx build -t ghcr.io/qicongsheng/$IMG_FULL_NAME --platform linux/amd64,linux/arm64 . --push
docker buildx build -t registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME --platform linux/amd64,linux/arm64 . --push
docker buildx build -t 42.192.22.70:8000/$IMG_FULL_NAME --platform linux/amd64,linux/arm64 . --push

