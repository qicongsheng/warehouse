#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/debian/debian12_builder.sh | /bin/sh
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/pickstar/pickstar_builder.sh | /bin/sh
IMG_NAME="debian"

curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/buildx_init.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/tmpdir_init.sh | /bin/sh -s $IMG_NAME
cd /tmp/_$IMG_NAME

curl -o /tmp/_$IMG_NAME/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/debian/Dockerfile_debian12
docker buildx build -t ghcr.io/qicongsheng/debian --platform linux/amd64,linux/arm64 . --push

curl -fsSL https://www.qics.top/shell/docker/common/cleanup.sh | /bin/sh -s $IMG_NAME



