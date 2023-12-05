#!/bin/bash
echo root:Star8ks.# | chpasswd
docker run -d --restart=always --name ssr_server -e PASSWORD=mimabujiandan -e METHOD=aes-128-gcm -p 19986:8388 -p 19986:8388/udp qics/shadowsocks:server
docker run -d --restart=always --name ssr_ssh_40088 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=proxy_play_ssh -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=22 -e REMOTE_PORT=40088 --network host qics/frp:client
docker run -d --restart=always --name ssr_frp_tencent -e SERVER_ADDR=play.qics.top -e PROXY_NAME=proxy_play_ssr -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=19986 -e REMOTE_PORT=49986 --network host qics/frp:client
docker run -d --restart=always --name cf_agent --net host qics/cloudflared tunnel --no-autoupdate run --token eyJhIjoiZTAwMWM4MzlmMTNiNzU2ZDc0YWI1NjE0MzFlM2ZlZDciLCJ0IjoiN2YxZGE0NDUtMTFkOC00NjNmLWFhNGMtNjBjNjA1MTcxODI4IiwicyI6Illqa3dOV1pqTkdZdFptUXhNaTAwTldReUxUazBOMlV0WkdNd05tTTNOell4WXpNMyJ9
docker run -d --restart=always --name webssh_server --net host -e --WEB_PORT=1990 qics/webssh


