#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/registry/registry_builder.sh | /bin/sh
IMG_NAME="registry"

curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/buildx_init.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/tmpdir_init.sh | /bin/sh -s $IMG_NAME
cd /tmp/_$IMG_NAME

curl -o /tmp/_$IMG_NAME/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/registry/Dockerfile
docker build -t ghcr.io/qicongsheng/registry . --push

curl -fsSL https://www.qics.top/shell/docker/common/cleanup.sh | /bin/sh -s $IMG_NAME



