# docker build -t qics/playdocker .
FROM qics/debian:latest
MAINTAINER qics

RUN curl -fsSL "https://www.qics.top/shell/debian/python39_install_debian_green.sh" | /bin/bash \
    && sed -i 's/echo plugin/curl -fsSL "https:\/\/www.qics.top\/shell\/docker\/dockerfiles\/playdocker\/playdocker.sh" | \/bin\/sh /g' /opt/startup.sh \
    && apt autoclean \
    && rm -fr /root/.cache/pip \
    && rm -fr /tmp/*

