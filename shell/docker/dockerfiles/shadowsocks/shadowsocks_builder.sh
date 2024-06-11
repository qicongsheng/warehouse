#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/shadowsocks/shadowsocks_builder.sh | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_shadowsocks
mkdir /tmp/_shadowsocks && cd /tmp/_shadowsocks
curl -o /tmp/_shadowsocks/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/shadowsocks/Dockerfile_shadowsocks_server
curl -fsSL https://www.qics.top/shell/docker/common/build_cross_platform.sh | /bin/sh -s "shadowsocks:server"
cd /tmp && rm -fr /tmp/_shadowsocks
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "qicongsheng/shadowsocks docker image pushed.", "content": "qicongsheng/shadowsocks docker image pushed."}'
