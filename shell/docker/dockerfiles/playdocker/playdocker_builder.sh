#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/playdocker/playdocker_builder.sh | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
rm -fr /tmp/_playdocker
mkdir /tmp/_playdocker
cd /tmp/_playdocker
curl -o /tmp/_playdocker/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/playdocker/Dockerfile
curl -fsSL https://www.qics.top/shell/docker/common/build_cross_platform.sh | /bin/sh -s "playdocker"
cd /tmp && rm -fr /tmp/_playdocker




