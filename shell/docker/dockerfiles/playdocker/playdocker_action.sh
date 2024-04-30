#!/bin/sh
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/playdocker/playdocker_action.sh" | /bin/sh
docker run -d --name chrome -p 4444:4444 -p 7900:7900 ghcr.io/qicongsheng/chrome
docker run -d --name playdocker --net=host ghcr.io/qicongsheng/playdocker
docker logs -f playdocker


