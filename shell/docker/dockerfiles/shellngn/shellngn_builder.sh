#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/shellngn/shellngn_builder.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_shellngn
mkdir /tmp/_shellngn && cd /tmp/_shellngn
curl -o /tmp/_shellngn/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/shellngn/Dockerfile
curl -o /tmp/_shellngn/bundle.js -L https://www.qics.top/shell/docker/dockerfiles/shellngn/bundle.js
docker build -t qics/shellngn:v1 .
cd /tmp && rm -fr /tmp/_shellngn




