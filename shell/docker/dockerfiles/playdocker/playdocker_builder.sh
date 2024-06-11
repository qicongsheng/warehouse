#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/playdocker/playdocker_builder.sh | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
rm -fr /tmp/_playdocker
mkdir /tmp/_playdocker
cd /tmp/_playdocker
curl -o /tmp/_playdocker/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/playdocker/Dockerfile
docker buildx build -t ghcr.io/qicongsheng/playdocker --platform linux/amd64,linux/arm64/v8 . --push
docker buildx build -t registry.cn-hangzhou.aliyuncs.com/qics/playdocker --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_playdocker




