#!/usr/bin/env bash

set -e
#export http_proxy=http://127.0.0.1:8118
#export https_proxy=http://127.0.0.1:8118
#set -x

# exit code
OK=0
NOT_ROOT_USER=85
BROOK_DOWNLOAD_ERROR=86
BROOK_SERVICE_ERROR=87
BBR_APPLIED_FAILED=88
PARAM_ERROR=89

# brook related params
BROOK_HOME=$(dirname $(readlink -f $0))
SERVER_ADDR="1.1.1.1"
SERVER_PASSWORD="jsycdut"
INSTALL_BROOK_ON_SERVERSIDE=
INSTALL_BROOK_ON_CLIENTSIDE=

# root privilege check, cause I need to write service file to sys directory
function root_privilege_check
{
  [[ $EUID -ne 0 ]] && echo "error! root privilege required, run as root" \
    && exit $NOT_ROOT_USER
}

# fetch brook binary, without integrity check
function fetch_brook_binary
{
  printf "start downloading brook...\n"
  curl --location --output brook \
    https://github.com/txthinking/brook/releases/download/v20210101/brook_linux_amd64
  [[ $? != 0 ]] && echo "error happened when download brook, check your network connection" && exit $BROOK_DOWNLOAD_ERROR
  printf "download finished\n"
  chmod +x brook
}

# write service file and make it automatically run after boot
function write_server_service_file
{
  cat > /lib/systemd/system/brook_server.service << BROOK
[Unit]
Description=Simple server-side service for brook
After=network.target
Wants=network.target

[Service]
Type=simple
ExecStart=$BROOK_HOME/brook servers -l "0.0.0.0:9997 $SERVER_PASSWORD" \
  -l "0.0.0.0:9998 $SERVER_PASSWORD" -l "0.0.0.0:9999 $SERVER_PASSWORD"
Restart=on-failure

[Install]
WantedBy=multi-user.target
BROOK

  systemctl enable brook_server.service \
    && systemctl daemon-reload \
    && systemctl start brook_server.service \
    || echo "error brook_server.service configuration failed, \
             check logs in journalctl for more details"; exit $BROOK_SERVICE_ERROR
}

function write_client_service_file
{
  cat > /lib/systemd/system/brook_server.service << BROOK
[Unit]
Description=Simple server-side service for brook
After=network.target
Wants=network.target

[Service]
Type=simple
ExecStart=$BROOK_HOME/brook client -s $SERVER_ADDR -p "$SERVER_PASSWORD" --socks5 0.0.0.0:9550
Restart=on-failure

[Install]
WantedBy=multi-user.target
BROOK

  systemctl enable brook_server.service \
    && systemctl daemon-reload \
    && systemctl start brook_server.service \
    || echo "error brook_server.service configuration failed, \
             check logs in journalctl for more details"; exit $BROOK_SERVICE_ERROR
}

function enable_bbr
{
  echo net.core.default_qdisc=fq >> /etc/sysctl.conf
  echo net.ipv4.tcp_congestion_control=bbr >> /etc/sysctl.conf
  sysctl -p
  tcp_congestion_control=$(cat /proc/sys/net/ipv4/tcp_congestion_control)
  [[ $tcp_congestion_control == "bbr" ]]  || echo "error apply bbr for tcp congestion control failed"; exit $BBR_APPLIED_FAILED
}

function help
{
  printf "%s\n" "Usage: ./brook.sh [{-s | --server} [-p server_password]] | [{-c | --client} server_address [-p server_password]] [-h | --help]"
  printf "%s\n" "{}: means params in {} are equal"
  printf "%s\n" "[]: means params in [] are optional"
  printf "%s\n" "install brook on your linux machine and make it a service running in background"
  printf "\n"
  printf "%s\n" "-h --help           print this messag"
  printf "%s\n" "-s --server         install and config brook as a server"
  printf "%s\n" "-c --client         install and config brook as a client"
  printf "%s\n" "-p --password       brook server password(default jsycdut), available for both brook server and client"
}

function check_left_param_account
{
  [[ $# -lt 2 ]] && echo "error, params missing, run ./brook.sh -h for help" \
    && exit $PARAM_ERROR
}

function install_brook_on_server
{
  root_privilege_check
  fetch_brook_binary
  write_client_service_file
}

function install_brook_on_client
{
  root_privilege_check
  fetch_brook_binary
  write_client_service_file
}

# be careful, no variable check
function main
{
  while [[ $1 ]]; do
    local option=$1
    case $option in
      -h | --help)
        help
        exit $OK
        ;;
      -s | --server)
        INSTALL_BROOK_ON_SERVERSIDE="OK, I know you want it installed in serverside"
        ;;
      -c | --client)
        INSTALL_BROOK_ON_CLIENTSIDE="fine, clientside aha"
        [[ $# -lt 2 ]] && echo "error, params missing, run ./brook.sh -h for help" \
          && exit $PARAM_ERROR
        shift
        SERVER_ADDR=$1
        ;;
      -p | --password)
        [[ $# -lt 2 ]] && echo "error, params missing, run ./brook.sh -h for help" \
          && exit $PARAM_ERROR
        shift
        SERVER_PASSWORD=$1
        ;;
    esac
    shift
  done

  if [[ -n $INSTALL_BROOK_ON_SERVERSIDE ]]; then
    printf "install brook on server on port 9997~9999 with password %s \n" $SERVER_PASSWORD
    read -p "Is that corrct? Press [y|Y] for comfirmation and installation will begin, any other key will abort the current process " confirmed
    [[ "$confirmed" == 'y' || "$confirmed" == 'Y' ]] && install_brook_on_server || echo "fine"
  elif [[ -n $INSTALL_BROOK_ON_CLIENTSIDE ]]; then
    printf "\n install brook as client, server address is %s with password %s\n" $SERVER_ADDR $SERVER_PASSWORD
    read -p "Is that corrct? Press [y|Y] for comfirmation and installation will begin, \
      any other key will abort the current process " confirmed
    [[ "$confirmed" == 'y' || "$confirmed" == 'Y' ]] && install_brook_on_client || echo "fine"
  else
    printf "nothing to do, done.\n"
  fi
}

[[ $# -eq 0 ]] && help && exit $OK
main $@
