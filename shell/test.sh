#!/bin/bash
curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
REGISTRY_SOURCE="ghcr.io/qicongsheng"
REGISTRY_TARGET="registry.cn-hangzhou.aliyuncs.com/qics"
curl -fsSL https://www.qics.top/shell/docker/common/img_cross_sync.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "frp"              "server"
