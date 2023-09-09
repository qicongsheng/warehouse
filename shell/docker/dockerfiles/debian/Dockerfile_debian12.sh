#!/bin/bash
apt install unzip wget curl -y
mkdir /tmp/work 
cd /tmp/work 
curl -o /tmp/work/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/debian/Dockerfile_debian12
docker build -t qics/test:debian_12 .
docker push qics/test:debian_12






