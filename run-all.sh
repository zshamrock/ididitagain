#!/bin/bash
ansible-playbook site.yml -i hosts --ask-become-pass --flush-cache $@
