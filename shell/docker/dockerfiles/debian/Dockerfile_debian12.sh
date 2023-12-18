#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/debian/Dockerfile_debian12.sh" | /bin/sh
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/pickstar/pickstar_builder.sh" | /bin/sh
rm -fr /tmp/work
mkdir /tmp/work && cd /tmp/work
curl -o /tmp/work/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/debian/Dockerfile_debian12
docker buildx build -t qics/debian --platform linux/amd64,linux/arm64 . --push
cd /tmp && rm -fr /tmp/work



