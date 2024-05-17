# docker build -t ghcr.io/qicongsheng/webdav . --push
# =================================
# docker run -d --restart=always -p 9080:80 -e USERNAME=qics -e PASSWORD=123456 -v /data/webdav:/var/lib/dav ghcr.io/qicongsheng/webdav
# =================================
FROM bytemark/webdav:latest
MAINTAINER qicongsheng

ENV AUTH_TYPE=Digest

