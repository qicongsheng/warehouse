#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/playdocker/playdocker_builder.sh" | /bin/sh
docker buildx create --name mutibuilder
docker buildx use mutibuilder
docker buildx inspect --bootstrap
rm -fr /tmp/_playdocker
mkdir /tmp/_playdocker
cd /tmp/_playdocker
curl -o /tmp/_playdocker/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/playdocker/Dockerfile
docker buildx build -t qics/playdocker --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_playdocker




