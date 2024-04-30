#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/shellngn/shellngn_builder.sh | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_shellngn
mkdir /tmp/_shellngn && cd /tmp/_shellngn
curl -o /tmp/_shellngn/bundle.js -L https://www.qics.top/shell/docker/dockerfiles/shellngn/bundle.js
curl -o /tmp/_shellngn/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/shellngn/Dockerfile
docker build -t ghcr.io/qicongsheng/shellngn . --push
cd /tmp && rm -fr /tmp/_shellngn




