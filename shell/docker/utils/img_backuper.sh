#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/utils/img_backuper.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
REGISTRY_URI="registry.cn-hangzhou.aliyuncs.com/qics"

curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "alist"            "latest"

