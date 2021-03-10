#!/bin/bash

PRIVILEGE_UNSUFFICIENT=86

if [[ $EUID -ne 0 ]]; then
  echo "need to be run as sudo or be root."
  exit $PRIVILEGE_UNSUFFICIENT
fi

# try to add user jsy and make it a superpower user
id jsy > /dev/null 2>&1
if [[ $? -ne 0 ]]; then
  useradd jsy -m -s /bin/bash
  passwd jsy
  echo "jsy ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/jsy
  echo "jsy is successfully added as a superpower user"
else
  echo "no need to do anything, jsy is alreay in this system"
fi

