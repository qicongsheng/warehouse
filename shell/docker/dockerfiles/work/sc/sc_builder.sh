#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/work/sc/sc_builder.sh | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_rabbitmq
mkdir /tmp/_rabbitmq && cd /tmp/_rabbitmq
curl -o /tmp/_rabbitmq/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/work/sc/Dockerfile_work_sc_rabbitmq
docker buildx build -t ghcr.io/qicongsheng/sc:rabbitmq --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_rabbitmq

mkdir /tmp/_redis && cd /tmp/_redis
curl -o /tmp/_redis/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/work/sc/Dockerfile_work_sc_redis
docker buildx build -t ghcr.io/qicongsheng/sc:redis --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_redis





