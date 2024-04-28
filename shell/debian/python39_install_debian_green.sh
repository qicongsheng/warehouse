#!/bin/bash
apt-get update 
apt-get install bzip2 build-essential libreadline-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev -y

while true; do
  rm -fr /tmp/python-3.9.12-debian.tar.gz
  echo 'start download python-3.9.12-debian.tar.gz ...'
  curl --connect-timeout 600 -m 7200 --continue-at - -o /tmp/python-3.9.12-debian.tar.gz https://fha48w.sn.files.1drv.com/y4mg0hBe1_yJ6aylVK-wL9ldhXrZ4RHWQAkqakwGSDa3ScsBTIZRGfGwppZ5MDtYgANa9cve8PhdstnwYUaDOJuCcFEbcl5n3vgabGZf6StO_-80pW42kuXhmDzW30GJAmS3XIhZ-cTTq29HALsiRopwq4Ka_WqJxjYgQytGEciBWEhRV9xg7mnKIi7oRJ70pr2BEpJE0YAim-xZiTnXIqsug
  echo 'download python-3.9.12-debian.tar.gz end ...'
  tar -zxvf /tmp/python-3.9.12-debian.tar.gz -C /usr/local
  if [ $? -eq 0 ]; then
    echo "解压成功，退出循环"
      break
  else
    echo "解压失败，重试"
  fi
done

echo "export PATH=\$PATH:/etc/sbin:/usr/local/python3/bin" >> /etc/profile
source /etc/profile
ln -sf /usr/local/python3/bin/python3.9 /usr/local/bin/python3
ln -sf /usr/local/python3/bin/python3.9 /bin/python3
ln -sf /usr/local/python3/bin/pip3.9 /usr/local/bin/pip3
rm -fr /tmp/python-3.9.12-debian.tar.gz

