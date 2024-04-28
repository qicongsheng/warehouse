#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/rclone/rclone_builder.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_rclone
mkdir /tmp/_rclone && cd /tmp/_rclone
curl -o /tmp/_rclone/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/rclone/Dockerfile
docker build -t qics/rclone . --push
cd /tmp && rm -fr /tmp/_rclone
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "qics/rclone docker image pushed.", "content": "qics/rclone docker image pushed."}'
