#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/frp/frp_builder.sh" | /bin/sh
rm -fr /tmp/_frpserver
mkdir /tmp/_frpserver && cd /tmp/_frpserver
curl -o /tmp/_frpserver/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/frp/Dockerfile_server
docker buildx build --build-arg FRP_VERSION=0.54.0 --platform linux/amd64,linux/arm64 -t qics/frp:server_0.54.0 . --push
docker buildx build --build-arg FRP_VERSION=0.54.0 --platform linux/amd64,linux/arm64 -t qics/frp:server . --push
cd /tmp && rm -fr /tmp/_frpserver


rm -fr /tmp/_frpclient
mkdir /tmp/_frpclient && cd /tmp/_frpclient
curl -o /tmp/_frpclient/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/frp/Dockerfile_client
docker buildx build --build-arg FRP_VERSION=0.54.0 --platform linux/amd64,linux/arm64 -t qics/frp:client_0.54.0 . --push
docker buildx build --build-arg FRP_VERSION=0.54.0 --platform linux/amd64,linux/arm64 -t qics/frp:client . --push
cd /tmp && rm -fr /tmp/_frpclient

