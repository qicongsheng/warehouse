#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import yagmail


def send_mail(nick_name="qicongsheng", to=['875881559@qq.com'], subject=None, contents=None, attachments=[]):
    yag = yagmail.SMTP(user={"qicongsheng@foxmail.com": nick_name}, password="fqhhihxsfozwbeic", host='smtp.qq.com')
    yag.send(to, subject, contents, attachments)


if __name__ == '__main__':
    send_mail(nick_name="bitwarden",
              subject="bitwarden backup finish. [%s]" % sys.argv[1],
              contents="bitwarden backup finish. [%s]" % sys.argv[1],
              attachments=[sys.argv[2]])
