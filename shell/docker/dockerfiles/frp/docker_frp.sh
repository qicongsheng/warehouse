#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/frp/docker_frp.sh" | /bin/sh
rm -fr /tmp/work 
mkdir /tmp/work 
cd /tmp/work 
curl -o /tmp/work/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/frp/server/Dockerfile
docker build -t qics/frp:server_0.52.2 .
docker push qics/frp:server_0.52.2

rm -fr  /tmp/work/Dockerfile
curl -o /tmp/work/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/frp/client/Dockerfile
docker build -t qics/frp:client_0.52.2 .
docker push qics/frp:client_0.52.2

docker tag qics/frp:server_0.52.2 qics/frp:server
docker tag qics/frp:client_0.52.2 qics/frp:client

docker push qics/frp:server
docker push qics/frp:client

# -------------------------------------------------
rm -fr /tmp/work 
mkdir /tmp/work 
cd /tmp/work 
curl -o /tmp/work/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/frp/client_pi/Dockerfile
docker build -t qics/frp:client_pi_0.52.2 .
docker push qics/frp:client_pi_0.52.2

docker tag qics/frp:client_pi_0.52.2 qics/frp:client_pi
docker push qics/frp:client_pi
