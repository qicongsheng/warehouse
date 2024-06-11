#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/qinglong/qinglong_builder.sh | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
rm -fr /tmp/_qinglong
mkdir /tmp/_qinglong
cd /tmp/_qinglong
curl -o /tmp/_qinglong/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/qinglong/Dockerfile
docker buildx build -t ghcr.io/qicongsheng/qinglong --platform linux/amd64,linux/arm64/v8 . --push
docker buildx build -t registry.cn-hangzhou.aliyuncs.com/qics/qinglong --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_qinglong




