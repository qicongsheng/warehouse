#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/mysql/mysql57_builder.sh | /bin/sh
IMG_NAME="mysql57"

curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/buildx_init.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/tmpdir_init.sh | /bin/sh -s $IMG_NAME
cd /tmp/_$IMG_NAME

curl -o /tmp/_$IMG_NAME/mysql-docker-mysql-server.tar.gz -L https://www.qics.top/shell/docker/dockerfiles/mysql/mysql-docker-mysql-server.tar.gz
tar -zxvf mysql-docker-mysql-server.tar.gz && cd mysql-docker-mysql-server/5.7

docker buildx build -t ghcr.io/qicongsheng/mysql:5.7x --platform linux/amd64,linux/arm64 . --push

curl -fsSL https://www.qics.top/shell/docker/common/cleanup.sh | /bin/sh -s $IMG_NAME



