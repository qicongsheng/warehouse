#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/mysql/mysql57_builder.sh | /bin/sh
IMG_NAME="mysql57"

curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/buildx_init.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/tmpdir_init.sh | /bin/sh -s $IMG_NAME
cd /tmp/_$IMG_NAME

curl -o /tmp/_$IMG_NAME/docker-entrypoint.sh -L https://www.qics.top/shell/docker/dockerfiles/mysql/5.7/docker-entrypoint.sh
curl -o /tmp/_$IMG_NAME/healthcheck.sh -L https://www.qics.top/shell/docker/dockerfiles/mysql/5.7/healthcheck.sh
curl -o /tmp/_$IMG_NAME/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/mysql/5.7/Dockerfile

docker build -t ghcr.io/qicongsheng/mysql:8.0 . --push

curl -fsSL https://www.qics.top/shell/docker/common/cleanup.sh | /bin/sh -s $IMG_NAME



