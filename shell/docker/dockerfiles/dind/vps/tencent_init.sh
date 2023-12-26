#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/dind/dind_tencent_init.sh" | /bin/sh
docker login -u=qics -p Best12167
docker run -d --restart=always -p 9000:80 -v /tmp:/etc/nginx/html --privileged=true qics/nginx
echo 'nginx start done......'
docker run -d --restart=always --net host --cap-add=NET_ADMIN -e NB_SETUP_KEY=951ABD0D-6D3D-47BB-AD78-A8F5D26F5DA7 qics/netbird
docker run -d --restart=always -e HOST=0.0.0.0 -e PORT=8066 --net host qics/shellngn
docker run -d --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=youarebadboy123#  qics/mysql:5.7

