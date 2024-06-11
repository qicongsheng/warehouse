#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/netbird/netbird_builder.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
rm -fr /tmp/_netbird
mkdir /tmp/_netbird && cd /tmp/_netbird
curl -o /tmp/_netbird/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/netbird/Dockerfile
docker buildx build -t ghcr.io/qicongsheng/netbird --platform linux/amd64,linux/arm64/v8 . --push
docker buildx build -t registry.cn-hangzhou.aliyuncs.com/qics/netbird --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_netbird
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "ghcr.io/qicongsheng/netbird docker image pushed.", "content": "ghcr.io/qicongsheng/netbird docker image pushed."}'
