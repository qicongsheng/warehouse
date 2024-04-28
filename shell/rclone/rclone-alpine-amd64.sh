#!/bin/bash
apk update && apk add --no-cache curl fuse -y
mkdir -p /opt/rclone/onedriver && mkdir -p /onedriver
curl --connect-timeout 600 -m 7200 --continue-at - -o /opt/rclone/rclone.conf https://www.qics.top/shell/docker/dockerfiles/rclone/rclone.conf
curl --connect-timeout 600 -m 7200 --continue-at - -o /opt/rclone/rclone https://dpsdag.sn.files.1drv.com/y4mAfHVvWgMMCqDMAlc6tVKbVa0KSwyq1PCHwOZMLs_mn2BWpi6HQVdSbhfnbcAXGTXSE6X2X2PsSJK-LiW9L0sSlSMCMi09afc58gm1o_C_VFi6mNcEc5i-bC9-CttXYak9XFmbNaZJjNWOtRxVZe0C-vBJ2GFQT2r05cLqmUVr6Zhb9xXCFe5OdtIuZy9he8tq9vRlXgDcwCweVeOHjiuHw
chmod +x /opt/rclone/rclone
ln -sf /opt/rclone/rclone /usr/local/bin/rclone
ln -s /bin/fusermount /bin/fusermount3
nohup rclone --config /opt/rclone/rclone.conf mount onedriver:/ /onedriver --copy-links --no-gzip-encoding --no-check-certificate --allow-other --allow-non-empty --umask 000 > /var/log/rclone.log 2>&1 &
