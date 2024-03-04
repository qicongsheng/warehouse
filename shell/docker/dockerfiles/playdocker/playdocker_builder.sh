#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/playdocker/playdocker_builder.sh" | /bin/sh
rm -fr /tmp/_playdocker
mkdir /tmp/_playdocker
cd /tmp/_playdocker
curl -o /tmp/_playdocker/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/playdocker/Dockerfile
docker build -t qics/playdocker . --push
cd /tmp && rm -fr /tmp/_playdocker




