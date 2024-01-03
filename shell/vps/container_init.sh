#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/vps/container_init.sh" | /bin/bash

#setup
apt update && apt install curl wget telnet dnsutils cron nload htop nmap net-tools iputils-ping -y
mkdir -p /var/spool/cron/crontabs

#屏蔽暴力破解
echo "*/1 * * * * curl -fsSL 'http://www.qics.top/shell/blockip.sh' | /bin/bash" >> /var/spool/cron/crontabs/root

#启动定时任务
chmod 600 /var/spool/cron/crontabs/root
/etc/init.d/cron restart

