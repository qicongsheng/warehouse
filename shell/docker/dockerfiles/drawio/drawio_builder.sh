#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/drawio/drawio_builder.sh" | /bin/sh
rm -fr /tmp/_drawio
mkdir /tmp/_drawio && cd /tmp/_drawio
curl -o /tmp/_drawio/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/drawio/Dockerfile
docker buildx build -t qics/drawio --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_drawio