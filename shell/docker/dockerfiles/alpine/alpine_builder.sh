#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/alpine/alpine_builder.sh" | /bin/sh
docker buildx create --name mutibuilder
docker buildx use mutibuilder
docker buildx inspect --bootstrap
cd /tmp && rm -fr /tmp/_alpine
mkdir /tmp/_alpine && cd /tmp/_alpine
curl -o /tmp/_alpine/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/alpine/Dockerfile
docker buildx build -t ghcr.io/qicongsheng/alpine --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_alpine
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "qicongsheng/alpine docker image pushed.", "content": "qics/qicongsheng docker image pushed."}'
