#!/bin/bash
case "$1" in
  "") ansible-playbook -i hosts/production playbook/site.yml -t update
  *)  ansible-playbook -i hosts/production playbook/site.yml -t update -l $1