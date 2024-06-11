#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/tinyproxy/tinyproxy_builder.sh | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_tinyproxy
mkdir /tmp/_tinyproxy && cd /tmp/_tinyproxy
curl -o /tmp/_tinyproxy/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/tinyproxy/Dockerfile
curl -fsSL https://www.qics.top/shell/docker/common/build_amd64_platform.sh | /bin/sh -s "tinyproxy"
cd /tmp && rm -fr /tmp/_tinyproxy




