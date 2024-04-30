#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/debian/vnc_builder.sh" | /bin/sh
rm -fr /tmp/_vnc
mkdir /tmp/_vnc && cd /tmp/_vnc
curl -o /tmp/_vnc/debian-vnc.zip -L https://www.qics.top/shell/docker/dockerfiles/debian/vnc/debian-vnc.zip
unzip debian-vnc.zip && cd debian-vnc && chmod -R 777 *
docker build -t ghcr.io/qicongshengtest:gui .

cd /tmp && rm -fr /tmp/_vnc
mkdir /tmp/_vnc && cd /tmp/_vnc
curl -o /tmp/_vnc/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/debian/vnc/Dockerfile
docker build -t ghcr.io/qicongshengdebian:vnc . --push
cd /tmp && rm -fr /tmp/_vnc
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "ghcr.io/qicongshengdebian:vnc docker image pushed.", "content": "ghcr.io/qicongshengdebian:vnc docker image pushed."}'



