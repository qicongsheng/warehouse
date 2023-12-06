#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/frp/docker_frp.sh" | /bin/sh
rm -fr /tmp/work 
mkdir /tmp/work 
cd /tmp/work 
curl -o /tmp/work/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/frp/Dockerfile_server
docker build -t qics/frp:server_0.52.3 .
docker push qics/frp:server_0.52.3

rm -fr  /tmp/work/Dockerfile
curl -o /tmp/work/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/frp/Dockerfile_client_amd64
docker build -t qics/frp:client_0.52.3 .
docker push qics/frp:client_0.52.3

docker tag qics/frp:server_0.52.3 qics/frp:server
docker tag qics/frp:client_0.52.3 qics/frp:client

docker push qics/frp:server
docker push qics/frp:client


