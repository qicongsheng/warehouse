#!/bin/bash
docker run -d --restart=always -p 8096:8096 registry.cn-hangzhou.aliyuncs.com/qics/jellyfin
docker run -d --restart=always -p 9000:80 -v /d/backup:/etc/nginx/html registry.cn-hangzhou.aliyuncs.com/qics/nginx
docker run -d --restart=always -e API_KEY=LAdoeJAuaq_uB2kCblxZDtF5wJFrDYHQfSHOFge0 -e ZONE=qics.top -e SUBDOMAIN=home registry.cn-hangzhou.aliyuncs.com/qics/ddns
docker run -d --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=youarebadboy123# registry.cn-hangzhou.aliyuncs.com/qics/mysql:5.7
docker run -d --restart=always --net=host registry.cn-hangzhou.aliyuncs.com/qics/cloudflared tunnel --no-autoupdate run --token eyJhIjoiZTAwMWM4MzlmMTNiNzU2ZDc0YWI1NjE0MzFlM2ZlZDciLCJ0IjoiNWM4MzdiNWMtODljYS00YzVmLTlhOWMtZGJkZDU5ODQwNjdjIiwicyI6Ik1HUm1aalJpTldRdE5URmhZeTAwTTJFekxUaGtNV1V0WWpCaU5tTTNORE0zT0RZdyJ9
docker run -d --restart=always -p 15672:15672 -p 5672:5672 registry.cn-hangzhou.aliyuncs.com/qics/sc:rabbitmq
docker run -d --restart=always -e REDIS_PASSWORD=Lhnekj#_83jf -p 6379:6379 registry.cn-hangzhou.aliyuncs.com/qics/sc:redis /bin/sh -c "redis-server --appendonly yes --requirepass ${REDIS_PASSWORD}"
docker run -d --restart=always -e USER=qics -e PASSWD=Best12167 -p 5902:5902 -p 3388:3389 registry.cn-hangzhou.aliyuncs.com/qics/deepin
docker run -d --restart=always --name=debian -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:9022:22 --privileged=true -v /d/backup/tmp:/tmp registry.cn-hangzhou.aliyuncs.com/qics/debian
