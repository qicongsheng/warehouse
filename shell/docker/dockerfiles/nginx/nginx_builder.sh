#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/nginx/nginx_builder.sh | /bin/sh
IMG_NAME="nginx"

curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/buildx_init.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/tmpdir_init.sh | /bin/sh -s $IMG_NAME
cd /tmp/_$IMG_NAME

curl -o /tmp/_$IMG_NAME/nginx.conf -L https://www.qics.top/shell/docker/dockerfiles/nginx/nginx.conf
curl -o /tmp/_$IMG_NAME/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/nginx/Dockerfile

curl -fsSL https://www.qics.top/shell/docker/common/build_cross_platform.sh | /bin/sh -s "nginx"

curl -fsSL https://www.qics.top/shell/docker/common/cleanup.sh | /bin/sh -s $IMG_NAME
