#!/usr/bin/env python
# -*- coding: UTF-8 -*-
import requests


def trigger():
    result = requests.get("https://www.qics.cc/workflows/image-builder-playdocker.yml")
    print(result.text)
    return result


if __name__ == "__main__":
    trigger()
