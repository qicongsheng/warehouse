#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/utils/img_syncer.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/buildx_init.sh | /bin/sh
# REGISTRY_SOURCE="ghcr.io/qicongsheng"
# REGISTRY_TARGET="registry.cn-hangzhou.aliyuncs.com/qics"
REGISTRY_SOURCE="registry.cn-hangzhou.aliyuncs.com/qics"
REGISTRY_TARGET="ccr.ccs.tencentyun.com/qicongsheng"

curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "alist"            "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "alpine"           "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_amd64_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "chrome"           "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "playdocker"       "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "cloudflared"      "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "ddns"             "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "debian"           "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "backup"           "huawei"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "backup"           "lenovo"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "backup"           "tencent"
curl -fsSL https://www.qics.top/shell/docker/common/sync_amd64_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "pickstar"         "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_amd64_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "debian"           "vnc"
curl -fsSL https://www.qics.top/shell/docker/common/sync_amd64_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "deepin"           "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "dind"             "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "drawio"           "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "frp"              "server"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "frp"              "client"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "jellyfin"         "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "kali"             "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_amd64_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "mysql"            "5.7"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "nascab"           "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "netbird"          "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "nexus"            "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "nginx"            "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "qinglong"         "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_amd64_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "rclone"           "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "registryui"       "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "shadowsocks"      "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_amd64_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "tinyproxy"        "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "traffmonetizer"   "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "vaultwarden"      "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_amd64_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "webdav"           "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "webssh"         "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "sc"               "rabbitmq"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "sc"               "redis"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "cloudreve"        "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "pgyvpn"           "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "privoxy"          "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_cross_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "samba"            "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_amd64_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "shellngn"         "latest"
curl -fsSL https://www.qics.top/shell/docker/common/sync_amd64_platform.sh | /bin/sh -s $REGISTRY_SOURCE $REGISTRY_TARGET "oracle12c"        "latest"
