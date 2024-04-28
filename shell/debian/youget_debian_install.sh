#!/bin/bash
# =================================
# curl -fsSL "https://www.qics.top/shell/debian/python39_install_debian_green.sh" | /bin/bash
# curl -fsSL "https://www.qics.top/shell/debian/youget_debian_install.sh" | /bin/bash
# curl -fsSL "https://www.qics.top/shell/rclone/rclone-debian-amd64.sh" | /bin/bash
# =================================
apt update && apt install ffmpeg -y
pip3 install --upgrade -i https://pypi.tuna.tsinghua.edu.cn/simple you-get

