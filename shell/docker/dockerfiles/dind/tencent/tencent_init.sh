#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/dind/dind_tencent_init.sh" | /bin/sh
docker login -u=qics -p Best12167
docker run -d --name nginx -p 9000:80 -v /tmp:/etc/nginx/html --privileged=true qics/nginx
docker run -d --name netbird --net host --cap-add=NET_ADMIN -e NB_SETUP_KEY=951ABD0D-6D3D-47BB-AD78-A8F5D26F5DA7 qics/netbird
docker run -d --name mysql_57 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=youarebadboy123#  qics/mysql:5.7

curl --connect-timeout 600 -m 7200 --continue-at - -o /tmp/database_create.sql https://www.qics.top/software/mysql/database_create.sql
curl --connect-timeout 600 -m 7200 --continue-at - -o /tmp/pickstar.sql https://www.qics.top/software/mysql/pickstar.sql
docker cp /tmp/database_create.sql mysql_57:/tmp
docker cp /tmp/pickstar.sql mysql_57:/tmp
docker exec -it mysql_57 sh -c 'mysql -uroot -pyouarebadboy123# -h 127.0.0.1  < /tmp/database_create.sql'
docker exec -it mysql_57 sh -c 'mysql -uroot -pyouarebadboy123# -h 127.0.0.1 ccs < /tmp/pickstar.sql'
docker exec -it mysql_57 sh -c 'rm -fr /tmp/*'
rm -fr /tmp/*

docker stop $(docker ps -a -q)

