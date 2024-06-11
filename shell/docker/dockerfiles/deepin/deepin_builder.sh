#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/deepin/deepin_builder.sh | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
rm -fr /tmp/_deepin
mkdir /tmp/_deepin
cd /tmp/_deepin
curl -o /tmp/_deepin/env -L https://www.qics.top/shell/docker/dockerfiles/deepin/env
curl -o /tmp/_deepin/xstartup -L https://www.qics.top/shell/docker/dockerfiles/deepin/xstartup
curl -o /tmp/_deepin/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/deepin/Dockerfile
curl -fsSL https://www.qics.top/shell/docker/common/build_amd64_platform.sh | /bin/sh -s "deepin"
rm -fr /tmp/_deepin



