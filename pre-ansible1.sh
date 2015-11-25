#!/bin/bash
sudo apt-get install python-pip python-dev
sudo pip install paramiko PyYAML Jinja2 httplib2 six markupsafe
sudo pip install ansible
export ANSIBLE_INVENTORY="${PWD}/ansible_hosts"
