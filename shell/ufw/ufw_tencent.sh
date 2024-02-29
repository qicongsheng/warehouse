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

deny_ports=(
19933
19986 29986 39986 49986 59986
22 1022 2022 3022 4022 5022 6022 7022 8022 9022
10088 11022 12022 13022 14022 15022 16022 17022 18022 19022
20088 21022 22022 23022 24022 25022 26022 27022 28022 29022
30088 31022 32022 33022 34022 35022 36022 37022 38022 39022
40088 41022 42022 43022 44022 45022 46022 47022 48022 49022
50088 51022 52022 53022 54022 55022 56022 57022 58022 59022
)
for deny_port in "${deny_ports[@]}"; do
    /usr/sbin/ufw deny $deny_port
done

sed -i '/ufw-before-input.*icmp/s/ACCEPT/DROP/g' /etc/ufw/before.rules
/usr/sbin/ufw reload

echo `date '+%Y-%m-%d %H:%M:%S'` "ufw set end" >> /var/log/ufw.log
