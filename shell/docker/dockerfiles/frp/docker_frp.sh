#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/frp/docker_frp.sh" | /bin/sh
rm -fr /tmp/_frpserver
mkdir /tmp/_frpserver
cd /tmp/_frpserver
curl -o /tmp/_frpserver/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/frp/Dockerfile_server
docker buildx build --build-arg FRP_VERSION=0.53.0 --platform linux/amd64,linux/arm64 -t qics/frp:server_0.53.0 . --push
docker buildx build --build-arg FRP_VERSION=0.53.0 --platform linux/amd64,linux/arm64 -t qics/frp:server . --push


rm -fr /tmp/_frpclient
mkdir /tmp/_frpclient
cd /tmp/_frpclient
curl -o /tmp/_frpclient/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/frp/Dockerfile_client_amd64
docker buildx build --build-arg FRP_VERSION=0.53.0 --platform linux/amd64,linux/arm64 -t qics/frp:client_0.53.0 . --push
docker buildx build --build-arg FRP_VERSION=0.53.0 --platform linux/amd64,linux/arm64 -t qics/frp:client . --push


