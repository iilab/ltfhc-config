#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
case "$2" in
  "") echo "Usage: run.sh deploy|diagnose|report|repair|update|backup provisioning|development|production|tunnel [machine] [output_directory]";;
  *) 
    case "$3" in
  	  "") if [[ $OSTYPE == darwin* ]]; 
		  then script -q /dev/null ansible-playbook -i $SCRIPTPATH/hosts/$2 $SCRIPTPATH/playbook/site.yml -t $1 2>&1 | tee $SCRIPTPATH/$1.log;
		  else script -c "ansible-playbook -i $SCRIPTPATH/hosts/$2 $SCRIPTPATH/playbook/site.yml -t $1" /dev/null 2>&1 | tee $SCRIPTPATH/$1.log;
		  fi;;
       *) case "$4" in
       	"") if [[ $OSTYPE == darwin* ]]; 
		    then script -q /dev/null ansible-playbook -i $SCRIPTPATH/hosts/$2 $SCRIPTPATH/playbook/site.yml -t $1 -l $3 2>&1 | tee $SCRIPTPATH/$1.log;
		    else script -c "ansible-playbook -i $SCRIPTPATH/hosts/$2 $SCRIPTPATH/playbook/site.yml -t $1 -l $3" /dev/null 2>&1 | tee $SCRIPTPATH/$1.log;
		    fi;;
       	 *) if [[ $OSTYPE == darwin* ]]; 
		    then script -q /dev/null ansible-playbook -i $SCRIPTPATH/hosts/$2 $SCRIPTPATH/playbook/site.yml -t $2 -l $3 2>&1 | tee $4/$1.log;
			else script -c "ansible-playbook -i $SCRIPTPATH/hosts/$2 $SCRIPTPATH/playbook/site.yml -t $1 -l $3" /dev/null 2>&1 | tee $4/$1.log;
			fi;;
        esac
	esac
esac