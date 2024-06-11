#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/alpine/alpine_builder.sh | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_alpine
mkdir /tmp/_alpine && cd /tmp/_alpine
curl -o /tmp/_alpine/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/alpine/Dockerfile
docker buildx build -t ghcr.io/qicongsheng/alpine --platform linux/amd64,linux/arm64/v8 . --push
docker buildx build -t registry.cn-hangzhou.aliyuncs.com/qics/alpine --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_alpine
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "qicongsheng/alpine docker image pushed.", "content": "qicongsheng/alpine docker image pushed."}'
