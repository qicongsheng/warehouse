#!/bin/bash
docker run -d --net=host --cap-add NET_ADMIN --env PGY_USERNAME="qicongsheng" --env PGY_PASSWORD="Best12167" qics/pgyvpn
docker run -d --restart=always --name ssr_server -e PASSWORD=mimabujiandan -e METHOD=aes-128-gcm -p 19986:8388 -p 19986:8388/udp qics/shadowsocks:server
docker run -d -p 9000:80 -v /tmp:/etc/nginx/html --privileged=true qics/nginx

