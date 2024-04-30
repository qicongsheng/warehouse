# docker buildx build -t ghcr.io/qicongsheng/kali --platform linux/amd64,linux/arm64/v8 . --push
FROM kalilinux/kali-rolling:latest
MAINTAINER qics

ENV USER=root \
    PASSWD=123456 \
    SSHD_PORT=22 \
    TZ=Asia/Shanghai

RUN apt update && apt upgrade -y \
    && apt install sudo vim net-tools openssh-server iputils-ping telnet nmap htop -y \
    && echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config \
    && echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config \

    && echo '#!/bin/bash' >> /opt/startup.sh \
    && echo 'echo [`date "+%Y-%m-%d %H:%M:%S"`] start up!' >> /opt/startup.sh \
    && echo 'echo "Port $SSHD_PORT" >> /etc/ssh/sshd_config' >> /opt/startup.sh \
    && echo 'useradd $USER' >> /opt/startup.sh \
    && echo 'echo $USER:$PASSWD | chpasswd' >> /opt/startup.sh \
    && echo '/etc/init.d/ssh restart' >> /opt/startup.sh \
    && echo 'tail -f /dev/null' >> /opt/startup.sh \

    && chmod +x /opt/startup.sh \
    && apt autoclean \
    && rm -fr /tmp/*

CMD ["/opt/startup.sh"]
