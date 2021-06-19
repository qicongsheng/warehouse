#!/bin/sh
docker run -d --net host --cap-add NET_ADMIN --env PGY_USERNAME="qicongsheng" --env PGY_PASSWORD="Best12167" qics/pgyvpn
docker run -d -e USER=root -e PASSWD=Best12167 -p 8022:22 -p 19986:19986 --privileged=true -v /tmp:/tmp qics/centos7:shodowsocks
