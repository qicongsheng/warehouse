#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/dind/dind_tencent_init.sh" | /bin/sh
docker login -u=qics -p Best12167
docker run -d --name mysql_57 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=youarebadboy123#  qics/mysql:5.7

sleep 60
curl --connect-timeout 600 -m 7200 --continue-at - -o /tmp/database_create.sql https://www.qics.top/software/mysql/database_create.sql
curl --connect-timeout 600 -m 7200 --continue-at - -o /tmp/pickstar.sql https://www.qics.top/software/mysql/pickstar.sql
docker cp /tmp/database_create.sql mysql_57:/tmp
docker cp /tmp/pickstar.sql mysql_57:/tmp
docker exec mysql_57 sh -c 'mysql -uroot -pyouarebadboy123# -h 127.0.0.1  < /tmp/database_create.sql'
docker exec mysql_57 sh -c 'mysql -uroot -pyouarebadboy123# -h 127.0.0.1 pickstar < /tmp/pickstar.sql'
docker exec mysql_57 sh -c 'rm -fr /tmp/*'
rm -fr /tmp/*

docker stop $(docker ps -a -q)

