# docker buildx build -t qics/alpine --platform linux/amd64,linux/arm64/v8 . --push
FROM alpine:3.15
MAINTAINER qics

ENV USER=root \
    PASSWD=123456 \
    SSHD_PORT=22 \
    TZ=Asia/Shanghai

RUN apk update \
    && apk add --no-cache sudo openssh-client openssh-server curl \
    && mkdir /var/run/sshd/  \
    && ssh-keygen -A \
    && echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config \
    && echo "alias ls='ls \$LS_OPTIONS --color'" >> /etc/profile \
    && echo "alias ll='ls \$LS_OPTIONS -l --color'" >> /etc/profile \
    && sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \

    && echo '#!/bin/sh' >> /opt/startup.sh \
    && echo 'echo "Port $SSHD_PORT" >> /etc/ssh/sshd_config' >> /opt/startup.sh \
    && echo 'adduser --shell /bin/sh --disabled-password --gecos "" $USER' >> /opt/startup.sh \
    && echo 'echo "$USER:$PASSWD" | chpasswd' >> /opt/startup.sh \
    && echo '/usr/sbin/sshd -D &' >> /opt/startup.sh \
    && echo 'tail -f /dev/null' >> /opt/startup.sh \

    && chmod +x /opt/startup.sh \
    && rm -fr /tmp/*

CMD ["/opt/startup.sh"]


