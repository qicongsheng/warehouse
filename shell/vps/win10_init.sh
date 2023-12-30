#!/bin/bash
docker run -d --restart=always -p 8096:8096 qics/jellyfin
docker run -d --restart=always -p 9000:80 -v /d/backup:/etc/nginx/html qics/nginx
docker run -d --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=youarebadboy123# qics/mysql:5.7
docker run -d --restart=always --net host qics/cloudflared tunnel --no-autoupdate run --token eyJhIjoiZTAwMWM4MzlmMTNiNzU2ZDc0YWI1NjE0MzFlM2ZlZDciLCJ0IjoiNWM4MzdiNWMtODljYS00YzVmLTlhOWMtZGJkZDU5ODQwNjdjIiwicyI6Ik1HUm1aalJpTldRdE5URmhZeTAwTTJFekxUaGtNV1V0WWpCaU5tTTNORE0zT0RZdyJ9
docker run -d --restart=always -p 15672:15672 -p 5672:5672 qics/sc:rabbitmq
docker run -d --restart=always -e REDIS_PASSWORD=Lhnekj#_83jf -p 6379:6379 qics/sc:redis /bin/sh -c "redis-server --appendonly yes --requirepass ${REDIS_PASSWORD}"


