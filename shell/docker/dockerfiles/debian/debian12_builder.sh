#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/debian/debian12_builder.sh" | /bin/sh
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/pickstar/pickstar_builder.sh" | /bin/sh
rm -fr /tmp/_debian12
mkdir /tmp/_debian12 && cd /tmp/_debian12
curl -o /tmp/_debian12/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/debian/Dockerfile_debian12
docker buildx build -t qics/debian --platform linux/amd64,linux/arm64 . --push
cd /tmp && rm -fr /tmp/_debian12
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "qics/debian docker image pushed.", "content": "qics/debian docker image pushed."}'


