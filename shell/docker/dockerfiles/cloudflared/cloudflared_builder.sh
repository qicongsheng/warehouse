#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/cloudflared/cloudflared_builder.sh | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
curl -fsSL "https://www.qics.top/shell/docker/common/buildx_init.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_cloudflared
mkdir /tmp/_cloudflared && cd /tmp/_cloudflared
curl -o /tmp/_cloudflared/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/cloudflared/Dockerfile
curl -fsSL https://www.qics.top/shell/docker/common/build_cross_platform.sh | /bin/sh -s "cloudflared" "latest"
cd /tmp && rm -fr /tmp/_cloudflared
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "ghcr.io/qicongsheng/cloudflared docker image pushed.", "content": "ghcr.io/qicongsheng/cloudflared docker image pushed."}'
