#!/bin/bash
case "$1" in
  "") echo "Usage: report development|production|tunnel [machine] [output_file]";;
  *) 
    case "$2" in
  	  "") if [[ $OSTYPE == darwin* ]]; 
		  then script -q /dev/null ansible-playbook -i hosts/$1 playbook/site.yml -t report 2>&1 | tee results.log;
		  else script -c "ansible-playbook -i hosts/$1 playbook/site.yml -t report" /dev/null 2>&1 | tee results.log;
		  fi;;
       *) case "$3" in
       	"") if [[ $OSTYPE == darwin* ]]; 
		    then script -q /dev/null ansible-playbook -i hosts/$1 playbook/site.yml -t report -l $2 2>&1 | tee results.log;
		    else script -c "ansible-playbook -i hosts/$1 playbook/site.yml -t report -l $2" /dev/null 2>&1 | tee results.log;
		    fi;;
       	 *) if [[ $OSTYPE == darwin* ]]; 
		    then script -q /dev/null ansible-playbook -i hosts/$1 playbook/site.yml -t report -l $2 2>&1 | tee $3;
			else script -c "ansible-playbook -i hosts/$1 playbook/site.yml -t report -l $2" /dev/null 2>&1 | tee $3;
			fi;;
        esac
	esac
esac
