#!/bin/bash
rm -fr /etc/systemd/system/docker.service.d
# 刷新配置项
systemctl daemon-reload
# 重启docker服务
systemctl restart docker

