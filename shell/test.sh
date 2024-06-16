#!/bin/bash
# curl -fsSL https://www.qics.top/shell/test.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/buildx_init.sh | /bin/sh
REGISTRY_SOURCE="registry.cn-hangzhou.aliyuncs.com/qics"
REGISTRY_TARGET="ccr.ccs.tencentyun.com/qicongsheng"

curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "dind"             "latest"
