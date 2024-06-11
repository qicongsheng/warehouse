#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/frp/frp_builder.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh

FRP_NEW_VERSION=$(wget -qO- -t1 -T2 "https://api.github.com/repos/fatedier/frp/releases/latest" | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/v//g;s/,//g;s/ //g')
echo "FRP_NEW_VERSION=$FRP_NEW_VERSION"
rm -fr /tmp/_frpserver
mkdir /tmp/_frpserver && cd /tmp/_frpserver
curl -o /tmp/_frpserver/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/frp/Dockerfile_server
curl -fsSL https://www.qics.top/shell/docker/common/build_cross_platform.sh | /bin/sh -s "frp:server_$FRP_NEW_VERSION"
curl -fsSL https://www.qics.top/shell/docker/common/build_cross_platform.sh | /bin/sh -s "frp:server"


cd /tmp && rm -fr /tmp/_frpserver
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "ghcr.io/qicongsheng/frp:server docker image pushed.", "content": "ghcr.io/qicongsheng/frp:server docker image pushed."}'


rm -fr /tmp/_frpclient
mkdir /tmp/_frpclient && cd /tmp/_frpclient
curl -o /tmp/_frpclient/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/frp/Dockerfile_client
curl -fsSL https://www.qics.top/shell/docker/common/build_cross_platform.sh | /bin/sh -s "frp:client_$FRP_NEW_VERSION"
curl -fsSL https://www.qics.top/shell/docker/common/build_cross_platform.sh | /bin/sh -s "frp:client"

cd /tmp && rm -fr /tmp/_frpclient
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "ghcr.io/qicongsheng/frp:client docker image pushed.", "content": "ghcr.io/qicongsheng/frp:client docker image pushed."}'

