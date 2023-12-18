#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/netbird/docker_netbird.sh" | /bin/sh
rm -fr /tmp/_netbird
mkdir /tmp/_netbird && cd /tmp/_netbird
curl -o /tmp/_netbird/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/netbird/Dockerfile
docker buildx build -t qics/netbird --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_netbird
