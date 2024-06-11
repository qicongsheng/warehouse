#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/drawio/drawio_builder.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
rm -fr /tmp/_drawio
mkdir /tmp/_drawio && cd /tmp/_drawio
curl -o /tmp/_drawio/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/drawio/Dockerfile
docker buildx build -t ghcr.io/qicongsheng/drawio --platform linux/amd64,linux/arm64/v8 . --push
docker buildx build -t registry.cn-hangzhou.aliyuncs.com/qics/drawio --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_drawio
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "ghcr.io/qicongsheng/drawio docker image pushed.", "content": "ghcr.io/qicongsheng/drawio docker image pushed."}'
