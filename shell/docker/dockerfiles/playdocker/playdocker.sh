#!/bin/sh
pip3 install pip --upgrade
pip3 install paramiko loguru selenium
curl -fsSL "https://www.qics.top/shell/docker/dockerfile/playdocker/frp_vpn.py" | /python3


