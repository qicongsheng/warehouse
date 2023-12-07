#cloudflared
docker run -d --restart=always --net host qics/cloudflared tunnel --no-autoupdate run --token eyJhIjoiZTAwMWM4MzlmMTNiNzU2ZDc0YWI1NjE0MzFlM2ZlZDciLCJ0IjoiMDM3N2MyNjYtMDg0OS00NTk0LWEzYTUtZTkyMThhYmRmNmQ0IiwicyI6IlltTm1OR1UyTURVdE5ESXpPUzAwTUdRNExXSTFOVEl0TVRCa05tRmpOemxqWW1FeCJ9
docker run -d --restart=always -p 9000:80 -v /D/backup:/etc/nginx/html --privileged=true qics/nginx
docker run -d --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=youarebadboy123#  qics/mysql:5.7
docker run -d --restart=always -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:9022:22 --privileged=true -v /tmp:/tmp qics/debian


