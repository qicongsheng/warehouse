# docker build -t qics/playdocker .
FROM qics/debian:latest
MAINTAINER qics

RUN curl -fsSL "https://www.qics.top/shell/debian/python39_install_debian_green.sh" | /bin/bash \
    && pip3 install pip --upgrade \
    && pip3 install paramiko loguru selenium \
    && apt autoclean \
    && rm -fr /root/.cache/pip \
    && rm -fr /tmp/*

