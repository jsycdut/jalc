#!/usr/bin/env bash

#set -e
#set -x
#export ALL_PROXY=socks5://127.0.0.1:9999

# exit code
OK=0
NOT_ROOT_USER=85
BROOK_DOWNLOAD_ERROR=86
BROOK_SERVICE_ERROR=87
BBR_APPLIED_FAILED=88
PARAM_ERROR=89
ONLY_CLIENT_OR_SERVER_ALLOWED=90

# brook related params
BROOK_HOME=$(dirname $(readlink -f $0))
SERVER_ADDR="1.1.1.1"
SERVER_PASSWORD="jsycdut"
INSTALL_BROOK_ON_SERVERSIDE=
INSTALL_BROOK_ON_CLIENTSIDE=

# colorful output
RED='\033[1;31m'
GREEN='\033[1;32m'
PURPLE='\033[1;35m'
WHITE='\033[1; 37m'
NORMAL='\033[0m'

# root privilege check, cause I need to write service file to sys directory
function root_privilege_check
{
  [[ $EUID -ne 0 ]] \
    && printf "${RED}error!${NORMAL} root privilege required, run as root \n" \
    && exit $NOT_ROOT_USER
}

# fetch brook binary, without integrity check
function fetch_brook_binary
{
  printf "${GREEN}start downloading brook...${NORMAL}\n"
  curl --location --output brook \
    https://github.com/txthinking/brook/releases/download/v20210101/brook_linux_amd64
  [[ $? != 0 ]] \
    && printf "${RED}error happened when download brook, check your network connection${NORMAL}" \
    && exit $BROOK_DOWNLOAD_ERROR
  printf "download finished\n"
  chmod +x brook
}

# write service file and make it automatically run after boot
function write_server_service_file
{
  cat > /lib/systemd/system/brook-server.service << BROOK
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

  systemctl enable brook-server.service \
    && systemctl daemon-reload \
    && systemctl start brook-server.service

  if [[ $? -ne 0 ]]; then
    echo "error brook-server.service configuration failed, check logs in journalctl for more details"
    exit $BROOK_SERVICE_ERROR
  fi
}

function write_client_service_file
{
  cat > /lib/systemd/system/brook-client.service << BROOK
[Unit]
Description=Simple client side service for brook
After=network.target
Wants=network.target

[Service]
Type=simple
ExecStart=$BROOK_HOME/brook client -s $SERVER_ADDR:9997 -p "$SERVER_PASSWORD" --socks5 0.0.0.0:9997
Restart=on-failure

[Install]
WantedBy=multi-user.target
BROOK

  systemctl enable brook-client.service \
    && systemctl daemon-reload \
    && systemctl start brook-client.service

  if [[ $? -ne 0 ]]; then
    echo "error brook-client.service configuration failed, check logs in journalctl for more details"
    exit $BROOK_SERVICE_ERROR
  fi
}

function enable_bbr
{
  echo net.core.default_qdisc=fq >> /etc/sysctl.conf
  echo net.ipv4.tcp_congestion_control=bbr >> /etc/sysctl.conf
  sysctl -p
  tcp_congestion_control=$(cat /proc/sys/net/ipv4/tcp_congestion_control)
  [[ $tcp_congestion_control != "bbr" ]] \
    && printf "${RED}error apply bbr for tcp congestion control failed${NORMAL}"
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
  [[ $# -lt 2 ]] \
    && printf "${RED}ERROR${NORMAL} params missing, run ./brook.sh -h for help" \
    && exit $PARAM_ERROR
}

function install_brook_on_server
{
  root_privilege_check
  fetch_brook_binary
  write_server_service_file
  enable_bbr
}

function install_brook_on_client
{
  root_privilege_check
  fetch_brook_binary
  write_client_service_file
}

function do_install
{
  if [[ -n "$INSTALL_BROOK_ON_SERVERSIDE" ]]; then
    printf "${GREEN}install brook on server on port 9997~9999 with password $SERVER_PASSWORD ${NORMAL}\n"
  elif [[ -n "$INSTALL_BROOK_ON_CLIENTSIDE" ]]; then
    printf "${GREEN}install brook as client, server address is %s with password %s ${NORMAL}\n" $SERVER_ADDR $SERVER_PASSWORD
  fi

  printf "Press ${PURPLE}[Y|y]${NORMAL} to continue, any other key will abrot: "

  read confirmed
  if [[ "$confirmed" == 'y' || "$confirmed" == 'Y' ]]; then
    if [[ "$1" == "${INSTALL_BROOK_ON_SERVERSIDE}" ]]; then
      install_brook_on_server
    elif [[ "$1" == "${INSTALL_BROOK_ON_CLIENTSIDE}" ]]; then
      install_brook_on_client
    fi
  else
    printf "${GREEN}Fine, nothing to do${NORMAL}\n"
    exit $OK
  fi

  if [[ $? == 0 ]]; then
    printf "${GREEN}yeap, all done, hope it works${NORMAL}\n"
  else
    printf "${RED} Absolutely error happened during the process, check log and try to repair it ${NORMAL}\n"
  fi
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
        [[ $# -lt 2 ]] \
          && printf "${RED}ERROR${NORMAL}, params missing, run ./brook.sh -h for help \n" \
          && exit $PARAM_ERROR
        shift
        SERVER_ADDR=$1
        ;;
      -p | --password)
        [[ $# -lt 2 ]] \
          && printf "${RED}ERROR${NORMAL}, params missing, run ./brook.sh -h for help \n" \
          && exit $PARAM_ERROR
        shift
        SERVER_PASSWORD=$1
        ;;
    esac
    shift
  done

  [[ -n "$INSTALL_BROOK_ON_SERVERSIDE" && -n "$INSTALL_BROOK_ON_CLIENTSIDE" ]] \
    && printf "${RED}you can't have your cake and eat it too${NORMAL}\n" \
    && exit $ONLY_CLIENT_OR_SERVER_ALLOWED

  if [[ -n "$INSTALL_BROOK_ON_SERVERSIDE" ]]; then
    do_install "$INSTALL_BROOK_ON_SERVERSIDE"
  elif [[ -n "$INSTALL_BROOK_ON_CLIENTSIDE" ]]; then
    do_install "$INSTALL_BROOK_ON_CLIENTSIDE"
  else
    printf "${PURPLE}nothing to do, done.${NORMAL}\n"
  fi
}

[[ $# -eq 0 ]] && help && exit $OK
main $@
