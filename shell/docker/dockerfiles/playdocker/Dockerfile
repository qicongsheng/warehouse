# docker build -t qics/playdocker .
FROM python:3.9-alpine
MAINTAINER qics

RUN apk add curl

ENTRYPOINT ["sh"]
CMD ["curl -fsSL 'https://www.qics.top/shell/docker/dockerfiles/playdocker/playdocker.sh' | /bin/sh"]
