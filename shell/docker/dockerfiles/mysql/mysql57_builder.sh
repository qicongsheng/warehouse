#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/mysql/mysql57_builder.sh | /bin/sh
IMG_NAME="mysql57"

curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/buildx_init.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/tmpdir_init.sh | /bin/sh -s $IMG_NAME
cd /tmp/_$IMG_NAME

curl -o /tmp/_$IMG_NAME/docker-entrypoint.sh -L https://www.qics.top/shell/docker/dockerfiles/mysql/5.7/docker-entrypoint.sh
curl -o /tmp/_$IMG_NAME/healthcheck.sh -L https://www.qics.top/shell/docker/dockerfiles/mysql/5.7/healthcheck.sh
curl -o /tmp/_$IMG_NAME/init_setting.sql -L https://www.qics.top/shell/docker/dockerfiles/mysql/5.7/init_setting.sql
curl -o /tmp/_$IMG_NAME/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/mysql/5.7/Dockerfile

chmod +x /tmp/_$IMG_NAME/docker-entrypoint.sh
chmod +x /tmp/_$IMG_NAME/healthcheck.sh

curl -fsSL https://www.qics.top/shell/docker/common/build_cross_platform.sh | /bin/sh -s "mysql:5.7"

curl -fsSL https://www.qics.top/shell/docker/common/cleanup.sh | /bin/sh -s $IMG_NAME



