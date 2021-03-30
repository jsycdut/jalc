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
  echo "set password for user jsy"
  passwd jsy
  echo "jsy ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/jsy
  echo "jsy is successfully added as a superpower user"
else
  echo "no need to do anything, jsy is alreay in this system"
fi

# change to jsy and add my public key
su - jsy
[[ ! -d "/home/jsy/.ssh" ]] && mkdir /home/jsy/.ssh
cat >> /home/jsy/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDalGLpFH4kY+8IdH4NOAWJMJwoRFn6vCuV1t52rjr1SU5vQk1vAXR3+NHDvYuCYp2ysfqxK7HG3b9rfh7caIsE+jM25GT1ksJLtJFcvD87feRAoE3uzcQ93QO6yq5Cwnd/mFcobi8d8w5c5hMf+ZVd8u3D0snYp4Uo98oDE7YdRp+T/L5hWA/SQCaUYptXNas4lqMZuGymdbkTwjGHTRWxPZdn+yh6/+lNOe6+HOx6MUqx74DPlFVqo7WW99+B+zii29Ehc69OYVyDJRvdcJ8IFDNTHNFfJniA6I1CVLcSlw7S/lnikxumNfWe2d1mrExYHpev01LVWW2pBAU60OAJ961GVTe+SJN/SaVMbIiRqTTybMVGLo5Ygy7AN2uqLkncdJbVLcBTgNJIzpbLYZXX8aHXH+V+uIHmzaBGuGfp3Zy3yj2Q8l9+isJZSqf/GnOmsd0pzAIh9U8+XftC2WA7Is8hIO1tQoh5bs2pqFS9FXLkaDVjmpElRhpcgux6kzs= corona@cas
EOF
