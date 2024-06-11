# docker build -t ghcr.io/qicongsheng/registry . --push
# =================================
# docker run -d --restart=always -p 9080:80 -e USERNAME=qics -e PASSWORD=123456 -v /data/webdav:/var/lib/dav ghcr.io/qicongsheng/registry
# =================================
FROM registry:2.8.3
MAINTAINER qicongsheng

ENV AUTH_TYPE=Digest

