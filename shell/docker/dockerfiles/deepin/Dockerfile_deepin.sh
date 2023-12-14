#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/deepin/Dockerfile_deepin.sh" | /bin/sh
rm -fr /tmp/work
mkdir /tmp/work
cd /tmp/work 
curl -o /tmp/work/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/deepin/Dockerfile
docker build -t qics/deepin .
docker push qics/deepin
rm -fr /tmp/work


