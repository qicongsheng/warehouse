#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import argparse


def hello(nick_name="qicongsheng", msg="xxx"):
    print("%s %s" % (nick_name, msg))

parser = argparse.ArgumentParser(description='Test for argparse')
parser.add_argument('--name', '-n', help='name 属性，非必要参数')
args = parser.parse_args()

if __name__ == '__main__':
    hello(nick_name=args.name, msg=args.name)
