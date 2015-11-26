#!/bin/bash
# install sudo
su - -c "apt-get install sudo"
# add user into sudo group
su - -c "usermod -a -G sudo ${USERNAME}"
echo "Please, logout, to apply groups changes"
echo "Then run ./pre-ansible1.sh"
