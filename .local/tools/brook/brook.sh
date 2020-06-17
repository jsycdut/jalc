#!/usr/bin/env bash

set -e

[[ ! -f brook_linux ]] && curl -Lo brook_linux \
  https://github.com/txthinking/brook/releases/download/v20200502/brook_linux_amd64

[[ ! -x brook_linux ]] && chmod u+x brook_linux

# go back end
nohup ./brook_linux client -s brook_server_ip_here:10000 -p jsycdut -i 127.0.0.1 -l :10000 &
nohup ./brook_linux socks5tohttp -s 127.0.0.1:10000 -l 0.0.0.0:8118 &
