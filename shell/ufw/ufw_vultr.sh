#!/bin/bash
echo `date '+%Y-%m-%d %H:%M:%S'` "ufw set start..."
echo y | /usr/sbin/ufw reset
echo y | /usr/sbin/ufw enable
/usr/sbin/ufw default allow

home_ip=$(nslookup -d home.qics.top pranab.ns.cloudflare.com | awk '/^Address:/{ip=$2} END{print ip}')
echo "home public ip $home_ip. add to ufw allow."
/usr/sbin/ufw allow from $home_ip

/usr/sbin/ufw deny 19986

echo `date '+%Y-%m-%d %H:%M:%S'` "ufw set end"
