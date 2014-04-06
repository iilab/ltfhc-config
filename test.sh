#!/bin/bash
case "$1" in
  "") ansible-playbook --syntax-check --list-tasks -i hosts/production playbook/site.yml
      ansible -m ping -i hosts/production all;;
  * ) ansible-playbook --syntax-check --list-tasks -i hosts/production playbook/site.yml -l $1
      ansible -m ping -i hosts/production $1;;
esac
