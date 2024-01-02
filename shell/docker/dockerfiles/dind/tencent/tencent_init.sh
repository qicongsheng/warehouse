#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/dind/dind_tencent_init.sh" | /bin/sh
docker login -u=qics -p Best12167
docker run -d --name nginx -p 9000:80 -v /tmp:/etc/nginx/html --privileged=true qics/nginx
docker run -d --name netbird --net host --cap-add=NET_ADMIN -e NB_SETUP_KEY=951ABD0D-6D3D-47BB-AD78-A8F5D26F5DA7 qics/netbird
docker run -d --name shellngn -e HOST=0.0.0.0 -e PORT=8066 --net host qics/shellngn
docker run -d --name mysql_57 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=youarebadboy123#  qics/mysql:5.7
docker run -d --name frp_server -e BIND_PORT=7000 -e DASHBOARD_PORT=7777 -e DASHBOARD_USER=qics -e DASHBOARD_PWD=123456 -e TOKEN=badboy --network host qics/frp:server
docker run -d --name cloudflared --net host qics/cloudflared tunnel --no-autoupdate run --token eyJhIjoiZTAwMWM4MzlmMTNiNzU2ZDc0YWI1NjE0MzFlM2ZlZDciLCJ0IjoiMTNjYmI4OTYtNjdkZS00NmY1LTkxOGEtZGE0YjA3NDNjMGE3IiwicyI6IlpUUTJaVGhpWXpjdE9HTXhZeTAwTm1OaUxXSmtZbU10TVRnd1lUZzVOelk0WldKaiJ9
docker run -d --name rabbitmq -p 15672:15672 -p 5672:5672 qics/sc:rabbitmq
docker run -d --name redis -e REDIS_PASSWORD=Lhnekj#_83jf -p 6379:6379 qics/sc:redis /bin/sh -c 'redis-server --appendonly yes --requirepass ${REDIS_PASSWORD}'
docker run -d --name nexus -p 8081:8081 -p 8520:8520 qics/nexus:dev
docker run -d --name pickstar -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:8022:22 -p 8082:8082 --privileged=true -v /tmp:/tmp qics/pickstar
docker run -d --name kali -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:6022:22 --privileged=true -v /tmp:/tmp qics/kali
docker run -d --name debian -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:9022:22 --privileged=true -v /tmp:/tmp qics/debian

curl --connect-timeout 600 -m 7200 --continue-at - -o /tmp/database_create.sql https://www.qics.top/software/mysql/database_create.sql
curl --connect-timeout 600 -m 7200 --continue-at - -o /tmp/pickstar.sql https://www.qics.top/software/mysql/pickstar.sql
docker cp /tmp/database_create.sql mysql_57:/tmp
docker cp /tmp/pickstar.sql mysql_57:/tmp
docker exec mysql_57 sh -c 'mysql -uroot -pyouarebadboy123# -h 127.0.0.1  < /tmp/database_create.sql'
docker exec mysql_57 sh -c 'mysql -uroot -pyouarebadboy123# -h 127.0.0.1 pickstar < /tmp/pickstar.sql'
docker exec mysql_57 sh -c 'rm -fr /tmp/*'
rm -fr /tmp/*

docker stop $(docker ps -a -q)

