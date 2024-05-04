#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys


def hello(nick_name="qicongsheng", msg="xxx"):
    print("%s %s" % (nick_name, msg))


if __name__ == '__main__':
    hello(nick_name=sys.argv[1], msg=sys.argv[2])
