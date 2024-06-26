#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/utils/img_backuper.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
REGISTRY_URI="registry.cn-hangzhou.aliyuncs.com/qics"

curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "alist"            "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "alpine"           "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_amd64_platform.sh | /bin/sh -s $REGISTRY_URI "chrome"           "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "playdocker"       "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "cloudflared"      "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "ddns"             "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "debian"           "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "backup"           "huawei"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "backup"           "lenovo"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "backup"           "tencent"
curl -fsSL https://www.qics.top/shell/docker/common/backup_amd64_platform.sh | /bin/sh -s $REGISTRY_URI "pickstar"         "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_amd64_platform.sh | /bin/sh -s $REGISTRY_URI "debian"           "vnc"
curl -fsSL https://www.qics.top/shell/docker/common/backup_amd64_platform.sh | /bin/sh -s $REGISTRY_URI "deepin"           "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "dind"             "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "drawio"           "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "frp"              "server"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "frp"              "client"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "jellyfin"         "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "kali"             "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_amd64_platform.sh | /bin/sh -s $REGISTRY_URI "mysql"            "5.7"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "nascab"           "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "netbird"          "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "nexus"            "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "nginx"            "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "qinglong"         "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_amd64_platform.sh | /bin/sh -s $REGISTRY_URI "rclone"           "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "registryui"       "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "shadowsocks"      "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_amd64_platform.sh | /bin/sh -s $REGISTRY_URI "tinyproxy"        "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "traffmonetizer"   "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "vaultwarden"      "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_amd64_platform.sh | /bin/sh -s $REGISTRY_URI "webdav"           "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "webssh"         "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "sc"               "rabbitmq"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "sc"               "redis"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "cloudreve"        "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "pgyvpn"           "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "privoxy"          "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_cross_platform.sh | /bin/sh -s $REGISTRY_URI "samba"            "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_amd64_platform.sh | /bin/sh -s $REGISTRY_URI "shellngn"         "latest"
curl -fsSL https://www.qics.top/shell/docker/common/backup_amd64_platform.sh | /bin/sh -s $REGISTRY_URI "oracle12c"        "latest"
