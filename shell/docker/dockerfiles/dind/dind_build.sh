#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/dind/dind_build.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_dind_official
mkdir /tmp/_dind_official && cd /tmp/_dind_official
curl -o /tmp/_dind_official/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/dind/25-rc/Dockerfile
curl -o /tmp/_dind_official/dockerd-entrypoint.sh -L https://www.qics.top/shell/docker/dockerfiles/dind/25-rc/dockerd-entrypoint.sh
chmod +x /tmp/_dind_official/dockerd-entrypoint.sh
docker buildx build -t qics/test:dind --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_dind_official

cd /tmp && rm -fr /tmp/*
mkdir /tmp/_dind && cd /tmp/_dind
curl -o /tmp/_dind/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/dind/Dockerfile
docker buildx build -t qics/dind --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/*



