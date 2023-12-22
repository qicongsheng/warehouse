#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/kali/docker_kali.sh" | /bin/sh
rm -fr /tmp/_kali
mkdir /tmp/_kali && cd /tmp/_kali
curl -o /tmp/_kali/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/kali/Dockerfile
docker buildx build -t qics/kali --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_kali

