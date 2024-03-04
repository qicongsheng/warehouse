#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/playdocker/chrome_builder.sh" | /bin/sh
rm -fr /tmp/_chrome
mkdir /tmp/_chrome
cd /tmp/_chrome
curl -o /tmp/_chrome/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/pickstar/Dockerfile
docker build -t qics/chrome . --push
cd /tmp && rm -fr /tmp/_chrome




