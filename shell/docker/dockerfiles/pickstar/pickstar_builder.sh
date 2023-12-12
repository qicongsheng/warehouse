#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/pickstar/pickstar_builder.sh" | /bin/sh
rm -fr /tmp/_pickstar
mkdir /tmp/_pickstar
cd /tmp/_pickstar
curl -o /tmp/_pickstar/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/pickstar/Dockerfile
docker build -t qics/pickstar .
cd /tmp && rm -fr /tmp/_pickstar




