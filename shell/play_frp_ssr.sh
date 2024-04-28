#!/bin/bash
echo root:Star8ks.# | chpasswd
docker run -d --restart=always --name ssr_server -e PASSWORD=mimabujiandan -e METHOD=aes-128-gcm -p 8388:8388 -p 8388:8388/udp --net=host --cap-add=NET_ADMIN qics/shadowsocks:server
docker run -d --restart=always --name ssr_frp_tencent -e SERVER_ADDR=play.qics.top -e PROXY_NAME=play_ssr -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=8388 -e REMOTE_PORT=49986 --net=host qics/frp:client
docker run -d --restart=always --name ssr_ssh_40088 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=play_ssh_40088 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=22 -e REMOTE_PORT=40088 --net=host qics/frp:client
docker run -d --restart=always --name ssr_ssh_9022 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=play_ssh_9022 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=9022 -e REMOTE_PORT=49022 --net=host qics/frp:client
# docker run -d --restart=always --name netbird -e NB_SETUP_KEY=951ABD0D-6D3D-47BB-AD78-A8F5D26F5DA7 --net=host --privileged=true qics/netbird
curl -fsSL "https://www.qics.top/shell/rclone/rclone-alpine-amd64.sh" | /bin/sh
docker run -d --restart=always --name debian12 -e USER=root -e PASSWD=Star8ks.# -e SSHD_PORT=9022 --net=host --privileged=true -v /tmp:/tmp qics/debian



