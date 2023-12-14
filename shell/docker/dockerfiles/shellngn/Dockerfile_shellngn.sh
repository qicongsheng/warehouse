#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/shellngn/Dockerfile_shellngn.sh" | /bin/sh
# docker cp pro-prod.sqlite 0705618ad574:/home/node/server/data/pro-prod.sqlite
cd /tmp && rm -fr /tmp/_shellngn
mkdir /tmp/_shellngn
cd /tmp/_shellngn
curl -o /tmp/_shellngn/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/shellngn/Dockerfile
curl -o /tmp/_shellngn/bundle.js -L https://www.qics.top/shell/docker/dockerfiles/shellngn/bundle.js
docker build -t qics/shellngn:v1 .
rm -fr /tmp/_shellngn




