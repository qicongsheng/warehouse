#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/vaultwarden/vaultwarden_builder.sh | /bin/sh
IMG_NAME="vaultwarden1"
curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/buildx_init.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/tmpdir_init.sh | /bin/sh

curl -o /tmp/_$IMG_NAME/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/vaultwarden/Dockerfile
docker buildx build -t ghcr.io/qicongsheng/$IMG_NAME --platform linux/amd64,linux/arm64 . --push

curl -fsSL https://www.qics.top/shell/docker/common/cleanup.sh | /bin/sh



