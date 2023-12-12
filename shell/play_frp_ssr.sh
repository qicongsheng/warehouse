#!/bin/bash
echo root:Star8ks.# | chpasswd
docker run -d --restart=always --net host --cap-add=NET_ADMIN -e NB_SETUP_KEY=951ABD0D-6D3D-47BB-AD78-A8F5D26F5DA7 qics/netbird
docker run -d --restart=always --name ssr_server -e PASSWORD=mimabujiandan -e METHOD=aes-128-gcm -p 19986:8388 -p 19986:8388/udp qics/shadowsocks:server
docker run -d --restart=always --name ssr_frp_tencent -e SERVER_ADDR=play.qics.top -e PROXY_NAME=proxy_play_ssr -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=19986 -e REMOTE_PORT=49986 --network host qics/frp:client
docker run -d --restart=always --name ssr_ssh_40088 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=proxy_play_ssh -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=22 -e REMOTE_PORT=40088 --network host qics/frp:client
docker run -d --restart=always --name ssr_ssh_9022 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=proxy_play_ssh_9022 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=9022 -e REMOTE_PORT=49022 --network host qics/frp:client
docker run -d --restart=always -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:9022:22 --privileged=true -v /tmp:/tmp qics/debian



