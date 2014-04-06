#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
case "$1" in
  "") ansible-playbook --syntax-check --list-tasks -i $SCRIPTPATH/hosts/production $SCRIPTPATH/playbook/site.yml
      ansible -m ping -i $SCRIPTPATH/hosts/production all;;
  * ) ansible-playbook --syntax-check --list-tasks -i $SCRIPTPATH/hosts/production $SCRIPTPATH/playbook/site.yml -l $1
      ansible -m ping -i $SCRIPTPATH/hosts/production $1;;
esac
