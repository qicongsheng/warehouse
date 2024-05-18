# docker buildx build -t ghcr.io/qicongsheng/alist --platform linux/amd64,linux/arm64 . --push
# =================================
# docker run -d --restart=always --name=alist -e PUID=0 -e PGID=0 -e UMASK=022 -p 9080:5244 -v /data/alist:/opt/alist/data -v /tmp:/tmp ghcr.io/qicongsheng/alist:latest
# =================================
FROM xhofe/alist:latest
MAINTAINER qicongsheng
