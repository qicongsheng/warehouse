#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/dind/dind_build.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_dind
mkdir /tmp/_dind && cd /tmp/_dind
curl -o /tmp/_dind/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/dind/Dockerfile
docker buildx build -t qics/dind --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_dind



