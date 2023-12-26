#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/dind/vps/tencent_boot.sh" | /bin/sh
docker run -d --name qics_dind --privileged=true -v /tmp:/tmp qics/dind
docker exec qics_dind sh -c 'curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/dind/vps/tencent_init.sh" | /bin/sh'
echo 'stoping qics_dind......'
docker stop qics_dind
echo 'stop qics_dind done......'
docker commit qics_dind qics/dind:tencent
docker push qics/dind:tencent
