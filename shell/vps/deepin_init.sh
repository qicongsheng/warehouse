#!/bin/bash
docker run -d --restart=always --name deepin_ssh_30088 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=deepin_ssh_30088 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=22 -e REMOTE_PORT=30088 --net=host qics/frp:client
docker run -d --restart=always --name deepin_ssh_39022 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=deepin_ssh_39022 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=9022 -e REMOTE_PORT=39022 --net=host qics/frp:client
docker run -d --restart=always -e NB_SETUP_KEY=951ABD0D-6D3D-47BB-AD78-A8F5D26F5DA7 --net=host --privileged=true qics/netbird
docker run -d --restart=always -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:9022:22 --privileged=true -v /tmp:/tmp qics/debian


