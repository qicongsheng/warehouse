#!/bin/bash
# 初始化crontab环境,清空定时任务
apt update && apt install cron -y
mkdir -p /var/spool/cron/crontabs
crontab -r

# 添加bitwarden备份定时任务
echo "30 1,13 * * * curl -fsSL http://www.qics.top/shell/docker/dockerfiles/backup/backup_crontab_bitwarden.sh | /bin/bash" >> /var/spool/cron/crontabs/root

# 重启crontab服务
chmod 600 /var/spool/cron/crontabs/root
/etc/init.d/cron restart
