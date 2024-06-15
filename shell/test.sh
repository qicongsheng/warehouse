#!/bin/bash
# curl -fsSL https://www.qics.top/shell/test.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
REGISTRY_URI="registry.cn-hangzhou.aliyuncs.com/qics"

curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "debian"           "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "backup"           "huawei"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "backup"           "lenovo"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "backup"           "tencent"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "frp"              "server"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "frp"              "client"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "sc"               "rabbitmq"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "sc"               "redis"
