#!/bin/bash
IMG_FULL_NAME=$1
docker build -t ghcr.io/qicongsheng/$IMG_FULL_NAME . --push
docker build -t registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME . --push

