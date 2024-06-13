#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/drawio/drawio_builder.sh | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
rm -fr /tmp/_drawio
mkdir /tmp/_drawio && cd /tmp/_drawio
curl -o /tmp/_drawio/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/drawio/Dockerfile
curl -fsSL https://www.qics.top/shell/docker/common/build_cross_platform.sh | /bin/sh -s "drawio" "latest"
cd /tmp && rm -fr /tmp/_drawio
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "ghcr.io/qicongsheng/drawio docker image pushed.", "content": "ghcr.io/qicongsheng/drawio docker image pushed."}'
