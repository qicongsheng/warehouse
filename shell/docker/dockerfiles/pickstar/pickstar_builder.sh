#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/pickstar/pickstar_builder.sh" | /bin/sh
rm -fr /tmp/_pickstar
mkdir /tmp/_pickstar
cd /tmp/_pickstar
curl -o /tmp/_pickstar/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/pickstar/Dockerfile
docker build -t qics/pickstar . --push
cd /tmp && rm -fr /tmp/_pickstar
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "qics/pickstar docker image pushed.", "content": "qics/pickstar docker image pushed."}'





