FROM qics/test:v1

ENV USER=testuser \
    PASSWD=1234 \
    SSHD_PORT=22 \
    VNC_PORT=5902 \
    XRDP_PORT=3389

ADD env /env
ADD xstartup /opt/xstartup

RUN echo '#!/bin/bash' >> /opt/startup.sh \
    && echo 'echo [`date "+%Y-%m-%d %H:%M:%S"`] start up!' >> /opt/startup.sh \

    && echo 'useradd -m $USER -p $(openssl passwd $PASSWD)' >> /opt/startup.sh \
    && echo 'usermod -aG sudo $USER' >> /opt/startup.sh \
    && echo 'chsh -s /bin/bash $USER' >> /opt/startup.sh \

    && echo 'mkdir -p /home/$USER/.vnc' >> /opt/startup.sh \
    && echo 'echo $PASSWD | vncpasswd -f > /home/$USER/.vnc/passwd' >> /opt/startup.sh \
    && echo 'chmod 0600 /home/$USER/.vnc/passwd' >> /opt/startup.sh \
    && echo 'chown -R $USER:$USER /home/$USER/.vnc' >> /opt/startup.sh \

    && echo 'chmod 555 /env' >> /opt/startup.sh \
    && echo 'sed -i "3 a cp /env ~/.xsessionrc" /etc/xrdp/startwm.sh' >> /opt/startup.sh \

    && echo 'cp -f /opt/xstartup /home/$USER/.vnc/xstartup' >> /opt/startup.sh \
    && echo 'sudo chmod +x /home/$USER/.vnc/xstartup' >> /opt/startup.sh \

    && echo 'service dbus start' >> /opt/startup.sh \
    && echo '/usr/lib/systemd/systemd-logind & service xrdp start' >> /opt/startup.sh \
    && echo 'sudo -u testuser -g testuser -- vncserver -rfbport 5902 -geometry 1920x1080 -depth 24 -verbose -localhost no -autokill no ' >> /opt/startup.sh \
    && echo 'tail -f /dev/null' >> /opt/startup.sh \

    && chmod +x /opt/startup.sh \
    && apt autoclean \
    && rm -fr /tmp/*

EXPOSE 3389
EXPOSE 5902

CMD ["/opt/startup.sh"]
