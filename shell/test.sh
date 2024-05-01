#!/bin/bash
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
#添加onedriver
curl -fsSL "https://www.qics.top/shell/rclone/rclone-debian-amd64.sh" | /bin/sh
ls /onedriver
cp /onedriver/oracle12c.tar /tmp
cd /tmp
docker load < oracle12c.tar



