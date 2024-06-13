#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/work/sc/sc_builder.sh | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_rabbitmq
mkdir /tmp/_rabbitmq && cd /tmp/_rabbitmq
curl -o /tmp/_rabbitmq/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/work/sc/Dockerfile_work_sc_rabbitmq
curl -fsSL https://www.qics.top/shell/docker/common/build_cross_platform.sh | /bin/sh -s "sc" "rabbitmq"
cd /tmp && rm -fr /tmp/_rabbitmq

mkdir /tmp/_redis && cd /tmp/_redis
curl -o /tmp/_redis/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/work/sc/Dockerfile_work_sc_redis
curl -fsSL https://www.qics.top/shell/docker/common/build_cross_platform.sh | /bin/sh -s "sc" "redis"
cd /tmp && rm -fr /tmp/_redis





