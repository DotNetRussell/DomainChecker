#!/bin/bash


if [ $# -eq 0 ]
      then
       echo './DomainChecker.sh <domain list file >'
else
       DOMAINS=$(cat $1)
       for DOMAIN in $DOMAINS
        do
                RESULT=$(ping -w 1 -c 1 $DOMAIN 2>/dev/null)
                if [[ $RESULT == *"1 received"* ]]
                        then
                                echo $DOMAIN | grep -v 'not known'
                fi
        done
fi
