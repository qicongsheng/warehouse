FROM ghcr.io/qicongsheng/test:gui
MAINTAINER qicongsheng

USER root

ENV USER=root \
    PASSWD=123456 \
    SSHD_PORT=22 \
    TZ=Asia/Shanghai 

ENV VNC_PW=$PASSWD

RUN apt update && apt upgrade -y \
    && apt install -y sudo openssh-client openssh-server curl vim \
    && mkdir -p /var/run/sshd/ && echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config \
    && echo "alias ls='ls \$LS_OPTIONS --color'" >> /root/.bashrc \
    && echo "alias ll='ls \$LS_OPTIONS -l --color'" >> /root/.bashrc \
    && echo "alias ls='ls \$LS_OPTIONS --color'" >> /headless/.bashrc \
    && echo "alias ll='ls \$LS_OPTIONS -l --color'" >> /headless/.bashrc \
    && sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources \

    && echo '#!/bin/bash' >> /opt/startup.sh \
    && echo 'echo [`date "+%Y-%m-%d %H:%M:%S"`] start up!' >> /opt/startup.sh \
    && echo 'sed -i "s/#Port 22/Port $SSHD_PORT/g" /etc/ssh/sshd_config' >> /opt/startup.sh \
    && echo 'useradd $USER' >> /opt/startup.sh \
    && echo 'echo $USER:$PASSWD | chpasswd' >> /opt/startup.sh \
    && echo 'echo "$USER ALL=(ALL:ALL) ALL" > /etc/sudoers.d/$USER' >> /opt/startup.sh \
    && echo 'mkdir -p /home/$USER && rm -fr /home/root' >> /opt/startup.sh \
    && echo 'chsh -s /bin/bash $USER' >> /opt/startup.sh \
    && echo '/usr/sbin/sshd -D &' >> /opt/startup.sh \
    && echo 'tail -f /dev/null' >> /opt/startup.sh \

    && chmod +x /opt/startup.sh \
    && apt autoclean \
    && rm -fr /tmp/*

CMD ["/opt/startup.sh"]