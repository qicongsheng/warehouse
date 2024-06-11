#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/webshell/webshell_builder.sh | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_websehll
mkdir /tmp/_websehll && cd /tmp/_websehll
curl -o /tmp/_websehll/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/webshell/Dockerfile
curl -fsSL https://www.qics.top/shell/docker/common/build_cross_platform.sh | /bin/sh -s "webssh"

cd /tmp && rm -fr /tmp/_websehll




