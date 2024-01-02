#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/dind/dind_tencent_init.sh" | /bin/sh
docker login -u=qics -p Best12167
docker run -d --name nginx -p 9000:80 -v /tmp:/etc/nginx/html --privileged=true qics/nginx
docker run -d --name netbird --net host --cap-add=NET_ADMIN -e NB_SETUP_KEY=951ABD0D-6D3D-47BB-AD78-A8F5D26F5DA7 qics/netbird

docker stop $(docker ps -a -q)

