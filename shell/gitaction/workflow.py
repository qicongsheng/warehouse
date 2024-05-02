#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# https://github.com/settings/tokens
import requests


def flow_run_with_shell_url(shell_url):
    url = f"https://api.github.com/repos/silentmoonblink/slingshot/actions/workflows/action-call.yml/dispatches"
    headers = {
        "Accept": "application/vnd.github+json",
        "Authorization": "Bearer ghp_flrqM0HQ8jbvXcGpBUO0" + "uWQFVR1wFd42Yy9J",
        "Content-Type": "application/json"
    }
    return requests.post(url, headers=headers, data='{"ref":"main", "inputs":{"shell_url":"' + shell_url + '"}}')


def flow_run_with_command(command):
    url = f"https://api.github.com/repos/silentmoonblink/slingshot/actions/workflows/action-call.yml/dispatches"
    headers = {
        "Accept": "application/vnd.github+json",
        "Authorization": "Bearer ghp_flrqM0HQ8jbvXcGpBUO0" + "uWQFVR1wFd42Yy9J",
        "Content-Type": "application/json"
    }
    return requests.post(url, headers=headers, data='{"ref":"main", "inputs":{"command":"' + command + '"}}')


if __name__ == '__main__':
    # response = flow_run_with_shell_url("https://www.qics.top/shell/docker/dockerfiles/alpine/alpine_builder.sh")
    response = flow_run_with_command("df /")
    if response.status_code == 204:
        print("Workflow Triggered!")
    else:
        print("Something went wrong. %s" % response.text)
