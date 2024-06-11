#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/dind/dind_builder.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_dind_official
mkdir /tmp/_dind_official && cd /tmp/_dind_official
curl -o /tmp/_dind_official/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/dind/25-rc/Dockerfile
curl -o /tmp/_dind_official/dockerd-entrypoint.sh -L https://www.qics.top/shell/docker/dockerfiles/dind/25-rc/dockerd-entrypoint.sh
chmod +x /tmp/_dind_official/dockerd-entrypoint.sh
docker buildx build -t ghcr.io/qicongsheng/test:dind --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_dind_official

cd /tmp && rm -fr /tmp/_dind
mkdir /tmp/_dind && cd /tmp/_dind
curl -o /tmp/_dind/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/dind/Dockerfile
docker buildx build -t ghcr.io/qicongsheng/dind --platform linux/amd64,linux/arm64/v8 . --push
docker buildx build -t registry.cn-hangzhou.aliyuncs.com/qics/dind --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_dind
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "ghcr.io/qicongsheng/dind docker image pushed.", "content": "ghcr.io/qicongsheng/dind docker image pushed."}'



