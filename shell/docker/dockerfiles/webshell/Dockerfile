# docker buildx build -t ghcr.io/qicongsheng/webssh --platform linux/amd64,linux/arm64 . --push
FROM python:3.9.17-alpine3.17
MAINTAINER qics

ARG TARGETARCH

RUN if [ "$TARGETARCH" = "arm64" ]; then \
      apk add gcc musl-dev libffi-dev; \
    fi \
    && pip install webssh \
    && echo "#!/bin/sh" >> /opt/startup.sh \
    && echo "nohup wssh --fbidhttp=False --address='0.0.0.0' --port=1990 &" >> /opt/startup.sh \
    && echo "tail -f /dev/null" >> /opt/startup.sh \
    && chmod +x /opt/startup.sh \
    && rm -fr /tmp/*

EXPOSE 1990

CMD ["/opt/startup.sh"]
