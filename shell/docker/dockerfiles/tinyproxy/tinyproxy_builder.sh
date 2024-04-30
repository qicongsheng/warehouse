#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/tinyproxy/tinyproxy_builder.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_tinyproxy
mkdir /tmp/_tinyproxy && cd /tmp/_tinyproxy
curl -o /tmp/_tinyproxy/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/tinyproxy/Dockerfile
docker build -t ghcr.io/qicongsheng/tinyproxy . --push
cd /tmp && rm -fr /tmp/_tinyproxy




