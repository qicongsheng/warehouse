#!/bin/sh
docker run -d --name chrome -p 4444:4444 -p 7900:7900 qics/chrome
docker run -d --name playdocker --net host qics/playdocker
docker logs -f playdocker


