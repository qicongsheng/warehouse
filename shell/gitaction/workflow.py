#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# https://github.com/settings/tokens
import requests


def flow_run(workflow_name):
    url = f"https://api.github.com/repos/silentmoonblink/slingshot/actions/workflows/{workflow_name}/dispatches"
    headers = {
        "Accept": "application/vnd.github+json",
        "Authorization": f"Bearer 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",
        "Content-Type": "application/json"
    }
    return requests.post(url, headers=headers, data='{"ref":"main"}')


if __name__ == '__main__':
    response = flow_run("image-builder-kali.yml")
    if response.status_code == 204:
        print("Workflow Triggered!")
    else:
        print("Something went wrong. %s" % response.text)
