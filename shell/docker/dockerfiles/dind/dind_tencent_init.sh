#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/dind/dind_tencent_init.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_dind_tencent_init
docker login -u=qics -p Best12167
docker run -d --restart=always -e BIND_PORT=7000 -e DASHBOARD_PORT=7777 -e DASHBOARD_USER=qics -e DASHBOARD_PWD=123456 -e TOKEN=badboy --network host qics/frp:server
docker run -d --restart=always -e HOST=0.0.0.0 -e PORT=8066 --net host qics/shellngn



