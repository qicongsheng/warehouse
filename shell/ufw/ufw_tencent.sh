#!/bin/bash
echo `date '+%Y-%m-%d %H:%M:%S'` "ufw set start..." >> /var/log/ufw.log
echo y | /usr/sbin/ufw reset
echo y | /usr/sbin/ufw enable
/usr/sbin/ufw default allow

home_ip=$(nslookup -d home.qics.top pranab.ns.cloudflare.com | awk '/^Address:/{ip=$2} END{print ip}')
echo "home public ip $home_ip. add to ufw allow." >> /var/log/ufw.log
tencent_ip=$(nslookup -d play.qics.top pranab.ns.cloudflare.com | awk '/^Address:/{ip=$2} END{print ip}')
echo "tencent ip $tencent_ip. add to ufw allow." >> /var/log/ufw.log

/usr/sbin/ufw allow from $home_ip
/usr/sbin/ufw allow from $tencent_ip

/usr/sbin/ufw deny 19986
/usr/sbin/ufw deny 29986
/usr/sbin/ufw deny 39986
/usr/sbin/ufw deny 49986
/usr/sbin/ufw deny 59986

/usr/sbin/ufw deny 22
/usr/sbin/ufw deny 1022
/usr/sbin/ufw deny 2022
/usr/sbin/ufw deny 3022
/usr/sbin/ufw deny 4022
/usr/sbin/ufw deny 5022
/usr/sbin/ufw deny 6022
/usr/sbin/ufw deny 7022
/usr/sbin/ufw deny 8022
/usr/sbin/ufw deny 9022
/usr/sbin/ufw deny 10088
/usr/sbin/ufw deny 11022
/usr/sbin/ufw deny 12022
/usr/sbin/ufw deny 13022
/usr/sbin/ufw deny 14022
/usr/sbin/ufw deny 15022
/usr/sbin/ufw deny 16022
/usr/sbin/ufw deny 17022
/usr/sbin/ufw deny 18022
/usr/sbin/ufw deny 19022
/usr/sbin/ufw deny 20088
/usr/sbin/ufw deny 21022
/usr/sbin/ufw deny 22022
/usr/sbin/ufw deny 23022
/usr/sbin/ufw deny 24022
/usr/sbin/ufw deny 25022
/usr/sbin/ufw deny 26022
/usr/sbin/ufw deny 27022
/usr/sbin/ufw deny 28022
/usr/sbin/ufw deny 29022
/usr/sbin/ufw deny 30088
/usr/sbin/ufw deny 31022
/usr/sbin/ufw deny 32022
/usr/sbin/ufw deny 33022
/usr/sbin/ufw deny 34022
/usr/sbin/ufw deny 35022
/usr/sbin/ufw deny 36022
/usr/sbin/ufw deny 37022
/usr/sbin/ufw deny 38022
/usr/sbin/ufw deny 39022
/usr/sbin/ufw deny 40088
/usr/sbin/ufw deny 41022
/usr/sbin/ufw deny 42022
/usr/sbin/ufw deny 43022
/usr/sbin/ufw deny 44022
/usr/sbin/ufw deny 45022
/usr/sbin/ufw deny 46022
/usr/sbin/ufw deny 47022
/usr/sbin/ufw deny 48022
/usr/sbin/ufw deny 49022
/usr/sbin/ufw deny 50088
/usr/sbin/ufw deny 51022
/usr/sbin/ufw deny 52022
/usr/sbin/ufw deny 53022
/usr/sbin/ufw deny 54022
/usr/sbin/ufw deny 55022
/usr/sbin/ufw deny 56022
/usr/sbin/ufw deny 57022
/usr/sbin/ufw deny 58022
/usr/sbin/ufw deny 59022

echo `date '+%Y-%m-%d %H:%M:%S'` "ufw set end" >> /var/log/ufw.log
