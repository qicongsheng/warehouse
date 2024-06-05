#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/backup/lenovo/backup_builder.sh | /bin/sh
IMG_NAME="backup_huawei"

curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/buildx_init.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/tmpdir_init.sh | /bin/sh -s $IMG_NAME
cd /tmp/_$IMG_NAME

curl -o /tmp/_$IMG_NAME/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/lenovo/tencent/Dockerfile
docker buildx build -t ghcr.io/qicongsheng/backup:lenovo --platform linux/amd64,linux/arm64 . --push

curl -fsSL https://www.qics.top/shell/docker/common/cleanup.sh | /bin/sh -s $IMG_NAME


