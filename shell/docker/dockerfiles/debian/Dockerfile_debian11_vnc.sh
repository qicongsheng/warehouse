#!/bin/bash
apt install wget curl unzip -y
mkdir /tmp/work
cd /tmp/work
curl -o /tmp/work/Dockerfile https://www.qics.top/shell/docker/dockerfiles/debian/Dockerfile_debian11_vnc
docker build -t qics/debian:vnc .
docker push qics/debian:vnc

