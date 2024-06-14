#!/bin/bash
curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
docker pull ghcr.io/qicongsheng/oracle12c:latest
docker tag ghcr.io/qicongsheng/oracle12c:latest ghcr.io/qicongsheng/oracle12c:latest_amd64
docker push ghcr.io/qicongsheng/oracle12c:latest_amd64
docker manifest create ghcr.io/qicongsheng/oracle12c:latest ghcr.io/qicongsheng/oracle12c:latest_amd64
docker manifest push ghcr.io/qicongsheng/oracle12c:latest
