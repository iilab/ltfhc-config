#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
case "$2" in
  "") echo "Usage: test.sh deploy|diagnose|report|repair|update|backup development|production|tunnel [machine]";;
  *) 
    case "$3" in
  	  "") if [[ $OSTYPE == darwin* ]]; 
		  then script -q /dev/null ansible-playbook --check --diff -i $SCRIPTPATH/hosts/$2 $SCRIPTPATH/playbook/site.yml -t $1 2>&1 | tee $SCRIPTPATH/test.log;
		  else script -c "ansible-playbook --check --diff -i $SCRIPTPATH/hosts/$2 $SCRIPTPATH/playbook/site.yml -t $1" /dev/null 2>&1 | tee $SCRIPTPATH/test.log;
		  fi;;
       *) case "$4" in
       	"") if [[ $OSTYPE == darwin* ]]; 
		    then script -q /dev/null ansible-playbook --check --diff -i $SCRIPTPATH/hosts/$2 $SCRIPTPATH/playbook/site.yml -t $1 -l $3 2>&1 | tee $SCRIPTPATH/test.log;
		    else script -c "ansible-playbook --check --diff -i $SCRIPTPATH/hosts/$2 $SCRIPTPATH/playbook/site.yml -t $1 -l $3" /dev/null 2>&1 | tee $SCRIPTPATH/test.log;
		    fi;;
       	 *) if [[ $OSTYPE == darwin* ]]; 
		    then script -q /dev/null ansible-playbook --check --diff -i $SCRIPTPATH/hosts/$2 $SCRIPTPATH/playbook/site.yml -t $2 -l $3 2>&1 | tee test.log;
			else script -c "ansible-playbook --check --diff -i $SCRIPTPATH/hosts/$2 $SCRIPTPATH/playbook/site.yml -t $1 -l $3" /dev/null 2>&1 | tee test.log;
			fi;;
        esac
	esac
esac