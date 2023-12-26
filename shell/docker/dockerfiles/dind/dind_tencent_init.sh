#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/dind/dind_tencent_init.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_dind_tencent_init
mkdir /tmp/_dind_tencent_init && cd /tmp/_dind_tencent_init
curl -o /tmp/_dind_tencent_init/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/dind/Dockerfile_tencent_init
docker build -t qics/dind:tencent . --push
cd /tmp && rm -fr /tmp/_dind_tencent_init



