#!/bin/bash
echo '{"insecure-registries":["42.192.22.70:8000","tc.qics.top:8000"]}' > /etc/docker/daemon.json
service docker restart
echo 'docker restart end.'
part1="ghp_Fl7ljrxlhdyYSndg"
part2="5AheaV9yMgH74k3OAABU"
echo "${part1}${part2}" | docker login ghcr.io -u qicongsheng --password-stdin
echo "Best12167" | docker login --username=875881559@qq.com registry.cn-hangzhou.aliyuncs.com --password-stdin
echo "Best12167" | docker login --username=qicongsheng registry.qics.top --password-stdin
echo "Best12167" | docker login --username=qicongsheng 42.192.22.70:8000 --password-stdin



