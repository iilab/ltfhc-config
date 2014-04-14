#!/bin/bash
case "$2" in
  "") ansible-playbook -i hosts/$1 playbook/site.yml -t update;;
  *)  ansible-playbook -i hosts/$1 playbook/site.yml -t update -l $1;;
esac