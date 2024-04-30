#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/vaultwarden/vaultwarden_builder.sh | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
IMG_NAME="vaultwarden"
cd /tmp && rm -fr /tmp/_$IMG_NAME
mkdir /tmp/_$IMG_NAME && cd /tmp/_$IMG_NAME
curl -o /tmp/_$IMG_NAME/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/vaultwarden/Dockerfile
docker buildx build -t ghcr.io/qicongsheng/$IMG_NAME --platform linux/amd64,linux/arm64 . --push
cd /tmp && rm -fr /tmp/_$IMG_NAME




