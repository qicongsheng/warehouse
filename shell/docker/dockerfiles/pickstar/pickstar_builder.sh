#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/pickstar/pickstar_builder.sh | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
rm -fr /tmp/_pickstar
mkdir /tmp/_pickstar
cd /tmp/_pickstar
curl -o /tmp/_pickstar/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/pickstar/Dockerfile
docker build -t ghcr.io/qicongsheng/pickstar . --push
docker build -t registry.cn-hangzhou.aliyuncs.com/qics/pickstar . --push
cd /tmp && rm -fr /tmp/_pickstar
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "ghcr.io/qicongsheng/pickstar docker image pushed.", "content": "ghcr.io/qicongsheng/pickstar docker image pushed."}'





