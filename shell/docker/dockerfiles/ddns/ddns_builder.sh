#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/ddns/ddns_builder.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_ddns
mkdir /tmp/_ddns && cd /tmp/_ddns
curl -o /tmp/_ddns/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/ddns/Dockerfile_cloudflare
docker buildx build -t ghcr.io/qicongsheng/ddns --platform linux/amd64,linux/arm64 . --push
cd /tmp && rm -fr /tmp/_ddns
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "ghcr.io/qicongsheng/ddns docker image pushed.", "content": "ghcr.io/qicongsheng/ddns docker image pushed."}'
