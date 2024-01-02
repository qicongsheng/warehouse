#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/dind/dind_tencent_init.sh" | /bin/sh
docker login -u=qics -p Best12167
docker run -d --name nginx -p 9000:80 -v /tmp:/etc/nginx/html --privileged=true qics/nginx
docker run -d --name netbird --net host --cap-add=NET_ADMIN -e NB_SETUP_KEY=951ABD0D-6D3D-47BB-AD78-A8F5D26F5DA7 qics/netbird
docker run -d --name shellngn -e HOST=0.0.0.0 -e PORT=8066 --net host qics/shellngn

curl --connect-timeout 600 -m 7200 --continue-at - -o /tmp/pro-prod.sqlite https://www.qics.top/software/shellngn/pro-prod.sqlite
chmod 777 /tmp/pro-prod.sqlite
docker cp /tmp/pro-prod.sqlite shellngn:/home/node/server/data/pro-prod.sqlite

docker stop $(docker ps -a -q)

