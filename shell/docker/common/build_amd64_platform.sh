#!/bin/bash
IMG_FULL_NAME=$1
docker build -t ghcr.io/qicongsheng/$IMG_FULL_NAME . --push
docker build -t registry.cn-hangzhou.aliyuncs.com/qics/$IMG_FULL_NAME . --push
docker build -t 42.192.22.70:8000/$IMG_FULL_NAME . --push
