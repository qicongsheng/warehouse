#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/other/other_builder.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/docker_login.sh | /bin/sh
curl -fsSL https://www.qics.top/shell/docker/common/buildx_init.sh | /bin/sh

cd /tmp && rm -fr /tmp/_cloudreve
mkdir /tmp/_cloudreve && cd /tmp/_cloudreve
curl -o /tmp/_cloudreve/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/other/Dockerfile_cloudreve
curl -fsSL https://www.qics.top/shell/docker/common/build_cross_platform.sh | /bin/sh -s "cloudreve" "latest"
cd /tmp && rm -fr /tmp/_cloudreve
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "qicongsheng/cloudreve docker image pushed.", "content": "qicongsheng/cloudreve docker image pushed."}'

cd /tmp && rm -fr /tmp/_pgyvpn
mkdir /tmp/_pgyvpn && cd /tmp/_pgyvpn
curl -o /tmp/_pgyvpn/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/other/Dockerfile_pgyvpn
curl -fsSL https://www.qics.top/shell/docker/common/build_cross_platform.sh | /bin/sh -s "pgyvpn" "latest"
cd /tmp && rm -fr /tmp/_pgyvpn
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "qicongsheng/pgyvpn docker image pushed.", "content": "qicongsheng/pgyvpn docker image pushed."}'

cd /tmp && rm -fr /tmp/_privoxy
mkdir /tmp/_privoxy && cd /tmp/_privoxy
curl -o /tmp/_privoxy/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/other/Dockerfile_privoxy
curl -fsSL https://www.qics.top/shell/docker/common/build_cross_platform.sh | /bin/sh -s "privoxy" "latest"
cd /tmp && rm -fr /tmp/_privoxy
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "qicongsheng/privoxy docker image pushed.", "content": "qicongsheng/privoxy docker image pushed."}'

cd /tmp && rm -fr /tmp/_samba
mkdir /tmp/_samba && cd /tmp/_samba
curl -o /tmp/_samba/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/other/Dockerfile_samba
curl -fsSL https://www.qics.top/shell/docker/common/build_cross_platform.sh | /bin/sh -s "samba" "latest"
cd /tmp && rm -fr /tmp/_samba
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "qicongsheng/samba docker image pushed.", "content": "qicongsheng/samba docker image pushed."}'

