# docker build -t qics/deepin . --push
FROM ubuntu:22.04

ENV USER=root \
    PASSWD=123456 \
    SSHD_PORT=22 \
    VNC_PORT=5902 \
    XRDP_PORT=3389

ADD env /env
ADD xstartup /opt/xstartup

RUN apt update && apt install -y software-properties-common && add-apt-repository -y ppa:ubuntudde-dev/stable \
    && DEBIAN_FRONTEND=noninteractive apt install -y xrdp locales sudo tigervnc-standalone-server ubuntudde-dde-extras ubuntudde-dde sudo openssh-client openssh-server curl \
    && adduser xrdp ssl-cert && locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8 \
    && mkdir -p /var/run/sshd/ \
    && echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config \

    && echo '#!/bin/bash' >> /opt/startup.sh \
    && echo 'echo [`date "+%Y-%m-%d %H:%M:%S"`] start up!' >> /opt/startup.sh \
    && echo 'echo "Port $SSHD_PORT" >> /etc/ssh/sshd_config' >> /opt/startup.sh \
    && echo 'useradd -m $USER -p $(openssl passwd $PASSWD)' >> /opt/startup.sh \
    && echo 'usermod -aG sudo $USER' >> /opt/startup.sh \
    && echo 'chsh -s /bin/bash $USER' >> /opt/startup.sh \

    && echo 'sed -i "s/port=3389/port=$XRDP_PORT/g' >> /opt/startup.sh \
    && echo 'chmod 555 /env && sed -i "3 a cp /env ~/.xsessionrc" /etc/xrdp/startwm.sh ' >> /opt/startup.sh \

    && echo 'mkdir -p /home/$USER/.vnc' >> /opt/startup.sh \
    && echo 'echo $PASSWD | vncpasswd -f > /home/$USER/.vnc/passwd' >> /opt/startup.sh \
    && echo 'chmod 0600 /home/$USER/.vnc/passwd' >> /opt/startup.sh \
    && echo 'chown -R $USER:$USER /home/$USER/.vnc' >> /opt/startup.sh \
    && echo 'cp -f /opt/xstartup /home/$USER/.vnc/xstartup' >> /opt/startup.sh \
    && echo 'chmod +x /home/$USER/.vnc/xstartup' >> /opt/startup.sh \

    && echo 'service dbus start' >> /opt/startup.sh \
    && echo '/usr/lib/systemd/systemd-logind & service xrdp start' >> /opt/startup.sh \
    && echo 'sudo -u $USER -g $USER -- vncserver -rfbport $VNC_PORT -geometry 1920x1080 -depth 24 -verbose -localhost no -autokill no' >> /opt/startup.sh \
    && echo '/usr/sbin/sshd -D &' >> /opt/startup.sh \
    && echo '# plugin position' >> /opt/startup.sh \
    && echo 'tail -f /dev/null' >> /opt/startup.sh \

    && chmod +x /opt/startup.sh \
    && apt autoclean \
    && rm -fr /tmp/*

EXPOSE 3389
EXPOSE 5902

CMD ["/opt/startup.sh"]
