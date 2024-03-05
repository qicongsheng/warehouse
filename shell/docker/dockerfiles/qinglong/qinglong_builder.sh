#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/qinglong/qinglong_builder.sh" | /bin/sh
docker buildx create --name mutibuilder
docker buildx use mutibuilder
docker buildx inspect --bootstrap
rm -fr /tmp/_qinglong
mkdir /tmp/_qinglong
cd /tmp/_qinglong
curl -o /tmp/_qinglong/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/qinglong/Dockerfile
docker buildx build -t qics/qinglong --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_qinglong




