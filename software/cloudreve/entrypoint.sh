#!/bin/bash

nohup python -u convert2mp4.py &
chmod +x ./cloudreve-main
./cloudreve-main -c /cloudreve/conf.ini
