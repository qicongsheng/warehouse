#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/vaultwarden/vaultwarden_backup.sh | /bin/bash
export TZ=Asia/Shanghai
DATE=$(date '+%Y%m%d%H%M%S')
cd /data
BACKUP_NAME="vaultwarden_$DATE.tar.gz"
rm -fr $BACKUP_NAME
rm -fr /onedriver/data/vaultwarden/$BACKUP_NAME
tar -zcvf $BACKUP_NAME vaultwarden
mkdir -p /onedriver/data/vaultwarden
cp $BACKUP_NAME /onedriver/data/vaultwarden/
rm -fr $BACKUP_NAME
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data "{\"nick_name\":\"bitwarden\", \"subject\": \"bitwarden backup finish. [$BACKUP_NAME]\", \"content\": \"bitwarden backup finish. [$BACKUP_NAME]\"}"


