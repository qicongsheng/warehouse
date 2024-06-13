#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/chrome/chrome_builder.sh | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
rm -fr /tmp/_chrome
mkdir /tmp/_chrome
cd /tmp/_chrome
curl -o /tmp/_chrome/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/chrome/Dockerfile
curl -fsSL https://www.qics.top/shell/docker/common/build_amd64_platform.sh | /bin/sh -s "chrome" "latest"
cd /tmp && rm -fr /tmp/_chrome




