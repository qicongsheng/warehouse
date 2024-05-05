#!/bin/bash
# curl -fsSL https://www.qics.top/shell/rclone/rclone-debian-amd64.sh | /bin/sh
# =================================
# 解除挂载 fusermount -u /onedriver
# =================================
if [ ! "$(command -v rclone)" ]; then
    echo "rclone 没有安装.开始安装rclone..." >&2
    apt update && apt install curl fuse -y
    mkdir -p /opt/rclone/onedriver && mkdir -p /onedriver
    curl --connect-timeout 600 -m 7200 --continue-at - -o /opt/rclone/rclone.conf https://www.qics.top/shell/docker/dockerfiles/rclone/rclone.conf
    curl --connect-timeout 600 -m 7200 --continue-at - -o /opt/rclone/rclone https://dpsdag.sn.files.1drv.com/y4mtuZvCRqO9wjOYxaDdQkVNZiQs8k4kZCi1w-Lo0SGbtNafj7mPCXl83K1ZTPd7ER-hwEcFh69CkXzviDPlBvkAw7IjbDV59b-_H0mmvFPHlKx8oECrh8IasuLYw40d34ZrcrUkYmMJdkXY8PtW5JU1oH_YiMTRctTiqWodbYc_i70E3qVNHSVJtUQerTCb_YozXnUucF7ohibXZhjYEwJYw
    chmod +x /opt/rclone/rclone
    ln -sf /opt/rclone/rclone /usr/local/bin/rclone
    ln -s /bin/fusermount /bin/fusermount3
    nohup rclone --config /opt/rclone/rclone.conf mount onedriver:/rclone/data /onedriver --copy-links --no-gzip-encoding --no-check-certificate --allow-other --allow-non-empty --umask 000 > /var/log/rclone.log 2>&1 &
    ls /onedriver/backup
    echo "rclone安装完成." >&2
fi