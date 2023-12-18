#!/bin/bash
docker run -d --restart=always -p 9000:80 -v /tmp:/etc/nginx/html --privileged=true qics/nginx
docker run -d --restart=always --net host --cap-add=NET_ADMIN -e NB_SETUP_KEY=951ABD0D-6D3D-47BB-AD78-A8F5D26F5DA7 qics/netbird
docker run -d --restart=always -e API_KEY=LAdoeJAuaq_uB2kCblxZDtF5wJFrDYHQfSHOFge0 -e ZONE=qics.top -e SUBDOMAIN=home qics/ddns
docker run -d --restart=always --name proxy_pi_ssh_30089 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=proxy_pi_ssh_30089 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=10088 -e REMOTE_PORT=30089 --network host qics/frp:client
docker run -d --restart=always --name proxy_pi_ssh_39023 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=proxy_pi_ssh_39023 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=9022 -e REMOTE_PORT=39023 --network host qics/frp:client
docker run -d --restart=always -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:9022:22 --privileged=true -v /tmp:/tmp qics/debian


