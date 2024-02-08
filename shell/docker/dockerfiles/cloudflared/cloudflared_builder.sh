#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/cloudflared/cloudflared_builder.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_cloudflared
mkdir /tmp/_cloudflared && cd /tmp/_cloudflared
curl -o /tmp/_cloudflared/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/cloudflared/Dockerfile
docker buildx build -t qics/cloudflared --platform linux/amd64,linux/arm64 . --push
cd /tmp && rm -fr /tmp/_cloudflared
