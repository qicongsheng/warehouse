#!/bin/bash
docker run -d --restart=always -p 9000:80 --privileged=true -v /tmp:/etc/nginx/html ghcr.io/qicongsheng/nginx
docker run -d --restart=always -e NB_SETUP_KEY=951ABD0D-6D3D-47BB-AD78-A8F5D26F5DA7 --net=host --privileged=true ghcr.io/qicongsheng/netbird
docker run -d --restart=always -e API_KEY=LAdoeJAuaq_uB2kCblxZDtF5wJFrDYHQfSHOFge0 -e ZONE=qics.top -e SUBDOMAIN=home ghcr.io/qicongsheng/ddns
docker run -d --restart=always --net=host ghcr.io/qicongsheng/cloudflared tunnel --no-autoupdate run --token eyJhIjoiZTAwMWM4MzlmMTNiNzU2ZDc0YWI1NjE0MzFlM2ZlZDciLCJ0IjoiMDM3N2MyNjYtMDg0OS00NTk0LWEzYTUtZTkyMThhYmRmNmQ0IiwicyI6IlltTm1OR1UyTURVdE5ESXpPUzAwTUdRNExXSTFOVEl0TVRCa05tRmpOemxqWW1FeCJ9
docker run -d --restart=always --name mini_nginx -e SERVER_ADDR=play.qics.top -e PROXY_NAME=mini_nginx -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=9000 -e REMOTE_PORT=29000 --net=host ghcr.io/qicongsheng/frp:client
docker run -d --restart=always --name mini_ssh_20088 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=mini_ssh_20088 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=10088 -e REMOTE_PORT=20088 --net=host qics/frp:client
docker run -d --restart=always --name mini_ssh_29022 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=mini_ssh_29022 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=9022 -e REMOTE_PORT=29022 --net=host qics/frp:client
docker run -d --restart=always -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:9022:22 --privileged=true -v /tmp:/tmp qics/debian


