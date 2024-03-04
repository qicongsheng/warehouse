#!/bin/sh
curl -o /tmp/frp_vpn.py -L https://www.qics.top/shell/docker/dockerfiles/playdocker/frp_vpn.py
chmod +x /tmp/frp_vpn.py
python /tmp/frp_vpn.py
tail -f /dev/null


