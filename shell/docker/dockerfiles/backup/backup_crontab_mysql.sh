#!/bin/bash
echo `date '+%Y-%m-%d %H:%M:%S'` "backup mysql start..." >> /var/log/mysql_backup.log
# 安装python3
curl -fsSL https://www.qics.top/shell/debian/python39_install_debian_green.sh | /bin/bash
source /etc/profile
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple yagmail
# 安装rclone
curl -fsSL https://www.qics.top/shell/rclone/rclone-debian-amd64.sh | /bin/sh

export TZ=Asia/Shanghai

DATE=$(date '+%Y%m%d_%H%M%S')
cd /data
BACKUP_NAME="mysql_$DATE.tar.gz"
rm -fr $BACKUP_NAME
echo `date '+%Y-%m-%d %H:%M:%S'` "tar $BACKUP_NAME package..." >> /var/log/mysql_backup.log
tar -zcvf $BACKUP_NAME mysql

# 备份到onedriver
echo `date '+%Y-%m-%d %H:%M:%S'` "upload onedriver $BACKUP_NAME package..." >> /var/log/mysql_backup.log
cp $BACKUP_NAME /onedriver/backup/mysql
rm -fr /onedriver/backup/mysql/mysql.tar.gz
mv /onedriver/backup/mysql/$BACKUP_NAME /onedriver/backup/mysql/mysql.tar.gz

rm -fr $BACKUP_NAME
echo `date '+%Y-%m-%d %H:%M:%S'` "end..." >> /var/log/mysql_backup.log


