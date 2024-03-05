#!/usr/bin/env python
# -*- coding: UTF-8 -*-
import requests


def trigger():
    return requests.get("https://www.qics.cc/workflows/image-builder-playdocker.yml")


if __name__ == "__main__":
    trigger()
