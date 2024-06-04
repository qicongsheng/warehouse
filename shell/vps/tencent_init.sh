#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/vps/tencent_init.sh" | /bin/bash

#setup
apt-get update
apt-get install ufw curl wget telnet dnsutils cron nload htop cpu-checker -y
mkdir -p /var/spool/cron/crontabs

#设置时区
echo "export TZ=Asia/Shanghai" >> /etc/profile
source /etc/profile

#修改远程登录端口(22->10088)
echo '' >> /etc/ssh/sshd_config
echo 'Port 10088' >> /etc/ssh/sshd_config
systemctl restart sshd.service

#修改root密码
echo root:@Best1216^78#9#@ | chpasswd

#ls & ll
echo "alias ls='ls \$LS_OPTIONS --color'" >> /root/.bashrc
echo "alias ll='ls \$LS_OPTIONS -l --color'" >> /root/.bashrc

#添加防火墙
curl -fsSL http://www.qics.top/shell/ufw/ufw_tencent.sh | /bin/bash
echo "0 */1 * * * curl -fsSL http://www.qics.top/shell/ufw/ufw_tencent.sh | /bin/bash" >> /var/spool/cron/crontabs/root
#屏蔽暴力破解
echo "*/1 * * * * curl -fsSL http://www.qics.top/shell/blockip.sh | /bin/bash" >> /var/spool/cron/crontabs/root

#启动定时任务
chmod 600 /var/spool/cron/crontabs/root
/etc/init.d/cron restart

#安装docker并启动文件服务器
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
service docker start
systemctl enable docker
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
# curl -fsSL "https://www.qics.top/shell/docker_set_proxy.sh" | /bin/bash
# service docker restart

curl -o /tmp/shellngn.tar -L https://snkg2q.sn.files.1drv.com/y4m3awfChqDOXKhEhBUZpsxVlfSCJKW2Z44qUR0miHL_rEBGE1Hbz0dRf8zWl0PLtbbeb_JKl1kpRq9khSNuo3meRQCmBMFPpI_bPhM3w6dn87C3TqQWQFTxE9h1vHEE8vXK54-swQSTLE5DO8QTBBhRk9U04KjYTBrSGPPGh12Y4Ddsko_VJ_g-13GZpS1EvQlsSzaAGqkgu4Y1ZAxcznwEA
docker load < /tmp/shellngn.tar
rm -fr /tmp/shellngn.tar
docker tag ghcr.io/qicongsheng/shellngn ghcr.nju.edu.cn/qicongsheng/shellngn
docker rmi ghcr.io/qicongsheng/shellngn

docker run -d --restart=always --name=nginx -p 9000:80 --privileged=true -v /tmp:/etc/nginx/html ghcr.nju.edu.cn/qicongsheng/nginx
docker run -d --restart=always --name=mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=youarebadboy123# -v /data/mysql:/var/lib/mysql ghcr.nju.edu.cn/qicongsheng/mysql:5.7
docker run -d --restart=always --name=vaultwarden -p 6068:80 -e SIGNUPS_ALLOWED=false -v /data/vaultwarden:/data ghcr.nju.edu.cn/qicongsheng/vaultwarden
docker run -d --restart=always --name=shellngn -e HOST=0.0.0.0 -e PORT=8066 -v /data/shellngn:/home/node/server/data --net=host ghcr.nju.edu.cn/qicongsheng/shellngn
docker run -d --restart=always --name=nexus -p 8081:8081 -v /data/nexus:/nexus-data ghcr.nju.edu.cn/qicongsheng/nexus
docker run -d --restart=always --name=qinglong -p 5700:5700 -v /data/qinglong:/ql/data ghcr.nju.edu.cn/qicongsheng/qinglong
docker run -d --restart=always --name=rabbitmq --net=host ghcr.nju.edu.cn/qicongsheng/sc:rabbitmq
docker run -d --restart=always --name=redis -e REDIS_PASSWORD=Lhnekj#_83jf -p 6379:6379 ghcr.nju.edu.cn/qicongsheng/sc:redis /bin/sh -c 'redis-server --appendonly yes --requirepass ${REDIS_PASSWORD}'
docker run -d --restart=always --name=frp -e BIND_PORT=7000 -e DASHBOARD_PORT=7777 -e DASHBOARD_USER=qics -e DASHBOARD_PWD=123456 -e TOKEN=badboy --net=host ghcr.nju.edu.cn/qicongsheng/frp:server
docker run -d --restart=always --name=cloudflared --net=host ghcr.nju.edu.cn/qicongsheng/cloudflared tunnel --no-autoupdate run --token eyJhIjoiZTAwMWM4MzlmMTNiNzU2ZDc0YWI1NjE0MzFlM2ZlZDciLCJ0IjoiMTNjYmI4OTYtNjdkZS00NmY1LTkxOGEtZGE0YjA3NDNjMGE3IiwicyI6IlpUUTJaVGhpWXpjdE9HTXhZeTAwTm1OaUxXSmtZbU10TVRnd1lUZzVOelk0WldKaiJ9
docker run -d --restart=always --name=netbird -e NB_SETUP_KEY=951ABD0D-6D3D-47BB-AD78-A8F5D26F5DA7 --net=host --privileged=true ghcr.nju.edu.cn/qicongsheng/netbird
docker run -d --restart=always --name=backup -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:3022:22 --privileged=true -v /data:/data ghcr.nju.edu.cn/qicongsheng/backup:tencent
docker run -d --restart=always --name=dind -e USER=root -e PASSWD=Star8ks.# -e SSHD_PORT=5022 --net=host --cap-add=NET_ADMIN --privileged=true -v /tmp:/tmp ghcr.nju.edu.cn/qicongsheng/dind
docker run -d --restart=always --name=kali -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:6022:22 --privileged=true -v /tmp:/tmp ghcr.nju.edu.cn/qicongsheng/kali
docker run -d --restart=always --name=debian -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:9022:22 --privileged=true -v /tmp:/tmp ghcr.nju.edu.cn/qicongsheng/debian

# curl -fsSL "https://www.qics.top/shell/docker_remove_proxy.sh" | /bin/bash

