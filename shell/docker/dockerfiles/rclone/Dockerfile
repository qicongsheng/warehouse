# docker buildx build -t ghcr.io/qicongsheng/rclone --platform linux/amd64,linux/arm64/v8 . --push
# docker run -d --restart=always --privileged=true -v /tmp:/tmp ghcr.io/qicongsheng/rclone
FROM alpine:3.15
MAINTAINER qicongsheng

RUN apk update \
    && apk add --no-cache curl fuse \
    && mkdir -p /opt/rclone/onedriver && mkdir -p /onedriver \
    && curl --connect-timeout 600 -m 7200 --continue-at - -o /opt/rclone/rclone.conf https://www.qics.top/shell/docker/dockerfiles/rclone/rclone.conf \
    && curl --connect-timeout 600 -m 7200 --continue-at - -o /opt/rclone/rclone https://dpsdag.sn.files.1drv.com/y4mtuZvCRqO9wjOYxaDdQkVNZiQs8k4kZCi1w-Lo0SGbtNafj7mPCXl83K1ZTPd7ER-hwEcFh69CkXzviDPlBvkAw7IjbDV59b-_H0mmvFPHlKx8oECrh8IasuLYw40d34ZrcrUkYmMJdkXY8PtW5JU1oH_YiMTRctTiqWodbYc_i70E3qVNHSVJtUQerTCb_YozXnUucF7ohibXZhjYEwJYw \
    && chmod +x /opt/rclone/rclone \
    && ln -sf /opt/rclone/rclone /usr/local/bin/rclone \
    && ln -s /bin/fusermount /bin/fusermount3 \

    && echo "alias ls='ls \$LS_OPTIONS --color'" >> /etc/profile \
    && echo "alias ll='ls \$LS_OPTIONS -l --color'" >> /etc/profile \

    && echo '#!/bin/sh' >> /opt/startup.sh \
    && echo 'echo [`date "+%Y-%m-%d %H:%M:%S"`] start up!' >> /opt/startup.sh \
    && echo 'nohup rclone --config /opt/rclone/rclone.conf mount onedriver:/rclone/data /onedriver --copy-links --no-gzip-encoding --no-check-certificate --allow-other --allow-non-empty --umask 000 > /var/log/rclone.log 2>&1 &' >> /opt/startup.sh \
    && echo 'tail -f /dev/null' >> /opt/startup.sh \

    && chmod +x /opt/startup.sh \
    && rm -fr /tmp/*

CMD ["/opt/startup.sh"]


