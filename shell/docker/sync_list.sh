#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/sync_list.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/buildx_init.sh | /bin/sh

REGISTRY_SOURCE="ghcr.io/qicongsheng"
REGISTRY_TARGET="registry.cn-hangzhou.aliyuncs.com/qics"

curl -fsSL https://www.qics.top/shell/docker/common/img_sync.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "alist" "latest"


