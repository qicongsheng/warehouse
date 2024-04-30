#!/bin/bash
docker run -d --name ssr_server -e PASSWORD=mimabujiandan -e METHOD=rc4-md5 -p 19986:8388 -p 19986:8388/udp ghcr.io/qicongsheng/shadowsocks:server
docker run -d --name ssr_client -e PASSWORD=mimabujiandan -e SERVER_ADDR=127.0.0.1 -e SERVER_PORT=19986 -e METHOD=rc4-md5 -p 1080:1080 -p 1080:1080/udp --net=host -d ghcr.io/qicongsheng/shadowsocks:client
docker run -d --name privoxy_server -e FORWARD_IP=127.0.0.1 -e FORWARD_PORT=1080 --cap-add=NET_ADMIN --net=host -p 8118:8118 -p 8118:8118/udp ghcr.io/qicongsheng/privoxy:latest
docker run -d --name privoxy_frp -e SERVER_ADDR=play.qics.top -e PROXY_NAME=proxy_play_privoxy -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=8118 -e REMOTE_PORT=48118 --net=host qics/frp:client


