# docker buildx build -t ghcr.io/qicongsheng/nexus --platform linux/amd64,linux/arm64/v8 . --push
# =================================
# docker run -d --restart=always -p 8081:8081 -v /data/nexus:/nexus-data ghcr.io/qicongsheng/nexus
# =================================
# docker run -d --restart=always --name=registry -p 8000:8000 -p 8443:8443 -p 8001:8081 -v /data/registry:/nexus-data ghcr.io/qicongsheng/nexus
# echo '{"insecure-registries":["42.192.22.70:8000","tc.qics.top:8000"]}' > /etc/docker/daemon.json
# docker login tc.qics.top:8000 -u qicongsheng -p Best12167
# =================================
FROM sonatype/nexus3
MAINTAINER qicongsheng

USER root

