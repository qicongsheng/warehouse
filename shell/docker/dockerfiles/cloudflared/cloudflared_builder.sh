#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/cloudflared/cloudflared_builder.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_cloudflared
mkdir /tmp/_cloudflared && cd /tmp/_cloudflared
curl -o /tmp/_cloudflared/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/cloudflared/Dockerfile
docker buildx build -t qics/cloudflared --platform linux/amd64,linux/arm64 . --push
cd /tmp && rm -fr /tmp/_cloudflared
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "qics/cloudflared docker image pushed.", "content": "qics/cloudflared docker image pushed."}'
