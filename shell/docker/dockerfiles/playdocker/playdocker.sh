#!/bin/sh
pip3 install pip --upgrade
pip3 install paramiko loguru selenium
echo 124565
curl -o /tmp/frp_vpn.py -L https://www.qics.top/shell/docker/dockerfile/playdocker/frp_vpn.py
chmod +x /tmp/frp_vpn.py
python /tmp/frp_vpn.py
tail -f /dev/null


