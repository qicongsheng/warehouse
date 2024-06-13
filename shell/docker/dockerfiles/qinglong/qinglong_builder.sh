#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/qinglong/qinglong_builder.sh | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
rm -fr /tmp/_qinglong
mkdir /tmp/_qinglong
cd /tmp/_qinglong
curl -o /tmp/_qinglong/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/qinglong/Dockerfile
curl -fsSL https://www.qics.top/shell/docker/common/build_cross_platform.sh | /bin/sh -s "qinglong" "latest"

cd /tmp && rm -fr /tmp/_qinglong




