# docker build -t qics/deepin . --push
FROM ubuntu:22.04

ENV USER=root \
    PASSWD=123456 \
    SSHD_PORT=22 \
    VNC_PORT=5902

ADD env /env
ADD xstartup /opt/xstartup

RUN apt update && apt install -y software-properties-common xrdp locales sudo tigervnc-standalone-server ubuntudde-dde-extras \
    && add-apt-repository -y ppa:ubuntudde-dev/stable && DEBIAN_FRONTEND=noninteractive apt install -y ubuntudde-dde \
    && adduser xrdp ssl-cert && locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8 \
    && sed -i '3 a cp /env ~/.xsessionrc' /etc/xrdp/startwm.sh \

RUN echo '#!/bin/bash' >> /opt/startup.sh \
    && echo 'echo [`date "+%Y-%m-%d %H:%M:%S"`] start up!' >> /opt/startup.sh \
    && echo 'useradd -m $USER -p $(openssl passwd $PASSWD)' >> /opt/startup.sh \
    && echo 'usermod -aG sudo $USER' >> /opt/startup.sh \
    && echo 'chsh -s /bin/bash $USER' >> /opt/startup.sh \

    && echo 'mkdir /home/$USER/.vnc' >> /opt/startup.sh \
    && echo 'echo $PASSWD | vncpasswd -f > /home/$USER/.vnc/passwd' >> /opt/startup.sh \
    && echo 'chmod 0600 /home/$USER/.vnc/passwd' >> /opt/startup.sh \
    && echo 'chown -R $USER:$USER /home/$USER/.vnc' >> /opt/startup.sh \
    && echo 'mv /opt/xstartup /home/$USER/.vnc/xstartup' >> /opt/startup.sh \
    && echo 'chmod +x /home/$USER/.vnc/xstartup' >> /opt/startup.sh \

    && echo 'service dbus start' >> /opt/startup.sh \
    && echo '/usr/lib/systemd/systemd-logind & service xrdp start' >> /opt/startup.sh \
    && echo 'sudo -u $USER -g $USER -- vncserver -rfbport 5902 -geometry 1920x1080 -depth 24 -verbose -localhost no -autokill no' >> /opt/startup.sh \
    && echo 'tail -f /dev/null' >> /opt/startup.sh \

    && chmod +x /opt/startup.sh \
    && apt autoclean \
    && rm -fr /tmp/*

EXPOSE 3389
EXPOSE 5902

CMD ["/opt/startup.sh"]
