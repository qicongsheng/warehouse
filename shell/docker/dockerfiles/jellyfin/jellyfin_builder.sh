#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/jellyfin/jellyfin_builder.sh | /bin/sh
IMG_NAME="jellyfin"

curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/buildx_init.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/tmpdir_init.sh | /bin/sh -s $IMG_NAME
cd /tmp/_$IMG_NAME

curl -o /tmp/_$IMG_NAME/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/jellyfin/Dockerfile
docker buildx build -t ghcr.io/qicongsheng/jellyfin --platform linux/amd64,linux/arm64/v8 . --push
docker buildx build -t registry.cn-hangzhou.aliyuncs.com/qics/jellyfin --platform linux/amd64,linux/arm64/v8 . --push

curl -fsSL https://www.qics.top/shell/docker/common/cleanup.sh | /bin/sh -s $IMG_NAME
