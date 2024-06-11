#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/webdav/webdav_builder.sh | /bin/sh
IMG_NAME="webdav"

curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/buildx_init.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/tmpdir_init.sh | /bin/sh -s $IMG_NAME
cd /tmp/_$IMG_NAME

curl -o /tmp/_$IMG_NAME/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/webdav/Dockerfile
curl -fsSL https://www.qics.top/shell/docker/common/build_amd64_platform.sh | /bin/sh -s "webdav"

curl -fsSL https://www.qics.top/shell/docker/common/cleanup.sh | /bin/sh -s $IMG_NAME



