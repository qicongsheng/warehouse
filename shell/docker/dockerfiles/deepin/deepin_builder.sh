#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/deepin/deepin_builder.sh" | /bin/sh
rm -fr /tmp/_deepin
mkdir /tmp/_deepin
cd /tmp/_deepin
curl -o /tmp/_deepin/env -L https://www.qics.top/shell/docker/dockerfiles/deepin/env
curl -o /tmp/_deepin/xstartup -L https://www.qics.top/shell/docker/dockerfiles/deepin/xstartup
curl -o /tmp/_deepin/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/deepin/Dockerfile
docker build -t ghcr.io/qicongsheng/deepin . --push
rm -fr /tmp/_deepin



