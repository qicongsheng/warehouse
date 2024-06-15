#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/utils/img_backuper.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/buildx_init.sh | /bin/sh
REGISTRY_SOURCE="ghcr.io/qicongsheng"
