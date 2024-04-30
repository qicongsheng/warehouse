#!/bin/bash
cd /tmp && rm -fr /tmp/_$IMG_NAME
curl --location --request POST 'http://www.qics.cc/mail' --header 'Content-Type: application/json' --data '{"nick_name":"gitaction", "subject": "qicongsheng/$IMG_NAME docker image pushed.", "content": "qicongsheng/$IMG_NAME docker image pushed."}'

