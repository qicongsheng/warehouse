#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/frp/docker_frp.sh" | /bin/sh
rm -fr /tmp/work 
mkdir /tmp/work 
cd /tmp/work 
curl -o /tmp/work/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/frp/Dockerfile_server
docker buildx build --build-arg FRP_VERSION=0.52.3 --platform linux/amd64,linux/arm64 -t qics/frp:server_0.52.3 . --push
docker push qics/frp:server_0.52.3
docker buildx build --build-arg FRP_VERSION=0.52.3 --platform linux/amd64,linux/arm64 -t qics/frp:server . --push
docker push qics/frp:server

rm -fr  /tmp/work/Dockerfile
curl -o /tmp/work/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/frp/Dockerfile_client_amd64
docker buildx build --build-arg FRP_VERSION=0.52.3 --platform linux/amd64,linux/arm64 -t qics/frp:client_0.52.3 . --push
docker push qics/frp:client_0.52.3
docker buildx build --build-arg FRP_VERSION=0.52.3 --platform linux/amd64,linux/arm64 -t qics/frp:client . --push
docker push qics/frp:client


