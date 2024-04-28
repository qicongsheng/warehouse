#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/rclone/rclone_builder.sh" | /bin/sh
cd /tmp && rm -fr /tmp/_rclone
mkdir /tmp/_rclone && cd /tmp/_rclone

while true; do
  rm -fr /tmp/_rclone/rclone-v1.66.0-linux-amd64.tar.gz
  echo 'start download rclone-v1.66.0-linux-amd64.tar ...'
  curl --connect-timeout 600 -m 7200 --continue-at - -o /tmp/rclone-v1.66.0-linux-amd64.tar.gz https://cna48w.sn.files.1drv.com/y4mfHK0CTRkysc9kYVdtTmd-w66ONo7Yh53KA3Y23NkaLcAULR0FRDaZG-L72bVfaF1uXoi9q4_inka8AhVBXL7DQ5mZ5bVoPWq6AUs4pDtJJs9plQTEi_uxIQ9YaWD3YwtChVul0r0F2reiZWu5cFN__gT7O8SY2JGdn5cNV3OKiY-CiATf11YcJZxvsCctw3SMIUaDynQPUQsJshKRI_rrw
  echo 'download rclone-v1.66.0-linux-amd64.tar end ...'

  if [ $? -eq 0 ]; then
    echo "解压成功，退出循环"
      break
  else
    echo "解压失败，重试"
  fi
done



curl -o /tmp/_rclone/Dockerfile -L https://www.qics.top/shell/docker/dockerfiles/rclone/Dockerfile



docker buildx build -t qics/alpine --platform linux/amd64,linux/arm64/v8 . --push
cd /tmp && rm -fr /tmp/_rclone
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "qics/alpine docker image pushed.", "content": "qics/alpine docker image pushed."}'
