#!/bin/bash
rm -fr /etc/systemd/system/docker.service.d
mkdir -p /etc/systemd/system/docker.service.d

cat >>/etc/systemd/system/docker.service.d/http-proxy.conf <<EOF
[Service]
Environment="HTTP_PROXY=http://play.qics.top:48118/" "HTTPS_PROXY=http://play.qics.top:48118/" "NO_PROXY=localhost,127.0.0.1,registry.docker-cn.com,hub-mirror.c.163.com"
EOF

# 刷新配置项
systemctl daemon-reload
# 重启docker服务
systemctl restart docker

