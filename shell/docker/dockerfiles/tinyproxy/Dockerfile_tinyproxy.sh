#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/tinyproxy/Dockerfile_tinyproxy.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_tinyproxy
mkdir /tmp/_tinyproxy && cd /tmp/_tinyproxy
curl -o /tmp/_tinyproxy/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/tinyproxy/Dockerfile
docker build -t qics/tinyproxy . --push
cd /tmp && rm -fr /tmp/_tinyproxy




