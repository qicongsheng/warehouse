#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/frp/frp_builder.sh | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh

FRP_NEW_VERSION=$(wget -qO- -t1 -T2 "https://api.github.com/repos/fatedier/frp/releases/latest" | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/v//g;s/,//g;s/ //g')
echo "FRP_NEW_VERSION=$FRP_NEW_VERSION"

# server
rm -fr /tmp/_frpserver
mkdir /tmp/_frpserver && cd /tmp/_frpserver
curl -o /tmp/_frpserver/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/frp/Dockerfile_server

docker buildx build --build-arg FRP_VERSION=$FRP_NEW_VERSION --platform linux/amd64 -t ghcr.io/qicongsheng/frp:server_amd64 . --load
docker buildx build --build-arg FRP_VERSION=$FRP_NEW_VERSION --platform linux/arm64 -t ghcr.io/qicongsheng/frp:server_arm64 . --load
docker push ghcr.io/qicongsheng/frp:server_amd64
docker push ghcr.io/qicongsheng/frp:server_arm64
docker manifest create ghcr.io/qicongsheng/frp:server ghcr.io/qicongsheng/frp:server_amd64 ghcr.io/qicongsheng/frp:server_arm64
docker manifest push ghcr.io/qicongsheng/frp:server

docker buildx build --build-arg FRP_VERSION=$FRP_NEW_VERSION --platform linux/amd64 -t registry.cn-hangzhou.aliyuncs.com/qics/frp:server_amd64 . --load
docker buildx build --build-arg FRP_VERSION=$FRP_NEW_VERSION --platform linux/arm64 -t registry.cn-hangzhou.aliyuncs.com/qics/frp:server_arm64 . --load
docker push registry.cn-hangzhou.aliyuncs.com/qics/frp:server_amd64
docker push registry.cn-hangzhou.aliyuncs.com/qics/frp:server_arm64
docker manifest create registry.cn-hangzhou.aliyuncs.com/qics/frp:server registry.cn-hangzhou.aliyuncs.com/qics/frp:server_amd64 registry.cn-hangzhou.aliyuncs.com/qics/frp:server_arm64
docker manifest push registry.cn-hangzhou.aliyuncs.com/qics/frp:server

cd /tmp && rm -fr /tmp/_frpserver
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "ghcr.io/qicongsheng/frp:server docker image pushed.", "content": "ghcr.io/qicongsheng/frp:server docker image pushed."}'

# client
rm -fr /tmp/_frpclient
mkdir /tmp/_frpclient && cd /tmp/_frpclient
curl -o /tmp/_frpclient/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/frp/Dockerfile_client

docker buildx build --build-arg FRP_VERSION=$FRP_NEW_VERSION --platform linux/amd64 -t ghcr.io/qicongsheng/frp:client_amd64 . --load
docker buildx build --build-arg FRP_VERSION=$FRP_NEW_VERSION --platform linux/arm64 -t ghcr.io/qicongsheng/frp:client_arm64 . --load
docker push ghcr.io/qicongsheng/frp:client_amd64
docker push ghcr.io/qicongsheng/frp:client_arm64
docker manifest create ghcr.io/qicongsheng/frp:client ghcr.io/qicongsheng/frp:client_amd64 ghcr.io/qicongsheng/frp:client_arm64
docker manifest push ghcr.io/qicongsheng/frp:client

docker buildx build --build-arg FRP_VERSION=$FRP_NEW_VERSION --platform linux/amd64 -t registry.cn-hangzhou.aliyuncs.com/qics/frp:client_amd64 . --load
docker buildx build --build-arg FRP_VERSION=$FRP_NEW_VERSION --platform linux/arm64 -t registry.cn-hangzhou.aliyuncs.com/qics/frp:client_arm64 . --load
docker push registry.cn-hangzhou.aliyuncs.com/qics/frp:client_amd64
docker push registry.cn-hangzhou.aliyuncs.com/qics/frp:client_arm64
docker manifest create registry.cn-hangzhou.aliyuncs.com/qics/frp:client registry.cn-hangzhou.aliyuncs.com/qics/frp:client_amd64 registry.cn-hangzhou.aliyuncs.com/qics/frp:client_arm64
docker manifest push registry.cn-hangzhou.aliyuncs.com/qics/frp:client

cd /tmp && rm -fr /tmp/_frpclient
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "ghcr.io/qicongsheng/frp:client docker image pushed.", "content": "ghcr.io/qicongsheng/frp:client docker image pushed."}'

