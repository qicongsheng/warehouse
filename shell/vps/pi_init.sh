#!/bin/bash
docker run -d --restart=always -p 9000:80 --privileged=true -v /tmp:/etc/nginx/html registry.cn-hangzhou.aliyuncs.com/qics/nginx
docker run -d --restart=always -e NB_SETUP_KEY=951ABD0D-6D3D-47BB-AD78-A8F5D26F5DA7 --net=host --privileged=true registry.cn-hangzhou.aliyuncs.com/qics/netbird
docker run -d --restart=always -e API_KEY=LAdoeJAuaq_uB2kCblxZDtF5wJFrDYHQfSHOFge0 -e ZONE=qics.top -e SUBDOMAIN=home registry.cn-hangzhou.aliyuncs.com/qics/ddns
docker run -d --restart=always --name pi_ssh_30088 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=pi_ssh_30088 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=22 -e REMOTE_PORT=30088 --net=host registry.cn-hangzhou.aliyuncs.com/qics/frp:client
docker run -d --restart=always --name pi_jellyfin -e SERVER_ADDR=play.qics.top -e PROXY_NAME=pi_jellyfin -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=8096 -e REMOTE_PORT=38096 --net=host registry.cn-hangzhou.aliyuncs.com/qics/frp:client
docker run -d --restart=always --name pi_ssh_39022 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=pi_ssh_39022 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=9022 -e REMOTE_PORT=39022 --net=host registry.cn-hangzhou.aliyuncs.com/qics/frp:client
docker run -d --restart=always -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:9022:22 --privileged=true -v /tmp:/tmp registry.cn-hangzhou.aliyuncs.com/qics/debian


