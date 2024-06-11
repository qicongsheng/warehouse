#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/kali/kali_builder.sh | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
rm -fr /tmp/_kali
mkdir /tmp/_kali && cd /tmp/_kali
curl -o /tmp/_kali/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/kali/Dockerfile
docker buildx build -t ghcr.io/qicongsheng/kali --platform linux/amd64,linux/arm64/v8 . --push
docker buildx build -t registry.cn-hangzhou.aliyuncs.com/qics/kali --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_kali
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "ghcr.io/qicongsheng/kali docker image pushed.", "content": "ghcr.io/qicongsheng/kali docker image pushed."}'

