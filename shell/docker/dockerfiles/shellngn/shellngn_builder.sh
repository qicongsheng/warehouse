#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/shellngn/shellngn_builder.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_shellngn
mkdir /tmp/_shellngn && cd /tmp/_shellngn
docker login -u=qics -p Best12167
curl -o /tmp/_shellngn/bundle.js -L https://www.qics.top/shell/docker/dockerfiles/shellngn/bundle.js
curl -o /tmp/_shellngn/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/shellngn/Dockerfile
docker build -t ghcr.io/qicongsheng/shellngn . --push
cd /tmp && rm -fr /tmp/_shellngn




