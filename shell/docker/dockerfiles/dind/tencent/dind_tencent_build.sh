#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/dind/tencent/dind_tencent_build.sh" | /bin/sh
docker login -u=qics -p Best12167
docker run -d --name qics_dind --privileged=true -v /tmp:/tmp ghcr.io/qicongsheng/dind
sleep 20
docker exec qics_dind sh -c 'curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/dind/tencent/tencent_init.sh" | /bin/sh'
echo 'stoping qics_dind......'
docker stop qics_dind
echo 'stop qics_dind done......'
docker commit qics_dind ghcr.io/qicongsheng/dind:tencent
docker push ghcr.io/qicongsheng/dind:tencent
