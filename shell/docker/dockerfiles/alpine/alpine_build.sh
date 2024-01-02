#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/alpine/alpine_build.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_alpine
mkdir /tmp/_alpine && cd /tmp/_alpine
curl -o /tmp/_alpine/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/debian/alpine/Dockerfile
docker buildx build -t qics/alpine --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_alpine
