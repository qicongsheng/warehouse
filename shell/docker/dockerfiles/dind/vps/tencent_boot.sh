#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/dind/vps/tencent_boot.sh" | /bin/sh
docker run -d --name qics_dind --privileged=true -v /tmp:/tmp qics/dind
docker exec -it qics_dind sh -c 'curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/dind/vps/tencent_init.sh" | /bin/sh'

