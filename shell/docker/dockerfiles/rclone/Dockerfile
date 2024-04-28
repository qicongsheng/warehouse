# docker buildx build -t qics/alpine --platform linux/amd64,linux/arm64/v8 . --push
FROM alpine:3.15
MAINTAINER qics

RUN apk update \
    && apk add --no-cache curl fuse \

    && curl --connect-timeout 600 -m 7200 --continue-at - -o /tmp/rclone-v1.66.0-linux-amd64.tar.gz https://cna48w.sn.files.1drv.com/y4mfHK0CTRkysc9kYVdtTmd-w66ONo7Yh53KA3Y23NkaLcAULR0FRDaZG-L72bVfaF1uXoi9q4_inka8AhVBXL7DQ5mZ5bVoPWq6AUs4pDtJJs9plQTEi_uxIQ9YaWD3YwtChVul0r0F2reiZWu5cFN__gT7O8SY2JGdn5cNV3OKiY-CiATf11YcJZxvsCctw3SMIUaDynQPUQsJshKRI_rrw \
    && tar -zxvf /tmp/rclone-v1.66.0-linux-amd64.tar.gz -C /opt \
    && mv /opt/rclone-v1.66.0-linux-amd64 /opt/rclone \
    && ln -sf /opt/rclone/rclone /usr/local/bin/rclone \
    && ln -s /bin/fusermount /bin/fusermount3 \
    && curl --connect-timeout 600 -m 7200 --continue-at - -o /opt/rclone/rclone.conf https://www.qics.top/shell/docker/dockerfiles/rclone/rclone.conf \
    && mkdir -p /opt/rclone/onedriver \

    && echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config \
    && echo "alias ls='ls \$LS_OPTIONS --color'" >> /etc/profile \
    && echo "alias ll='ls \$LS_OPTIONS -l --color'" >> /etc/profile \
    && sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \

    && echo '#!/bin/sh' >> /opt/startup.sh \
    && echo 'echo [`date "+%Y-%m-%d %H:%M:%S"`] start up!' >> /opt/startup.sh \
    && echo 'nohup rclone --config /opt/rclone/rclone.conf mount onedriver:/ /opt/rclone/onedriver --copy-links --no-gzip-encoding --no-check-certificate --allow-other --allow-non-empty --umask 000 &' >> /opt/startup.sh \
    && echo 'tail -f /dev/null' >> /opt/startup.sh \

    && chmod +x /opt/startup.sh \
    && rm -fr /tmp/*

CMD ["/opt/startup.sh"]


