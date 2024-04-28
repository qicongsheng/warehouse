#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/rclone/rclone-debian-arm64.sh" | /bin/sh
apt update && apt install curl fuse -y
mkdir -p /opt/rclone/onedriver && mkdir -p /onedriver
curl --connect-timeout 600 -m 7200 --continue-at - -o /opt/rclone/rclone.conf https://www.qics.top/shell/docker/dockerfiles/rclone/rclone.conf
curl --connect-timeout 600 -m 7200 --continue-at - -o /opt/rclone/rclone https://dvuqua.sn.files.1drv.com/y4mK_Z3FuDaidv0ynxcjiClhkfxStCp6gpnb-HHnXo_I1_zRgHXeO31STOrvKqRJhGJ9lTka5tlmJbVC1AjWCJQgz0le9jMocmzqArcc0dr9pPjBx7rbRjmQ3dVDy_4meXg_Yt8wGKTf7fTJvX8aVZ-OU8GnKK6_r_bw36GIAnBj9JKJrE2HDx1XH6SH13fDrFqdjbxWyizXA8-T-dcKZRJ5Q
chmod +x /opt/rclone/rclone
ln -sf /opt/rclone/rclone /usr/local/bin/rclone
ln -s /bin/fusermount /bin/fusermount3
nohup rclone --config /opt/rclone/rclone.conf mount onedriver:/rclone/data /onedriver --copy-links --no-gzip-encoding --no-check-certificate --allow-other --allow-non-empty --umask 000 > /var/log/rclone.log 2>&1 &
