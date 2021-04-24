#!/bin/bash
  
echo "which process what to kill"
read TOKILL

kill $(ps aux | grep $TOKILL | grep -v grep | awk '{ print $2 }')
                                                                                                                      
# grep -v grep = -v, --invert-match  select non-matching lines 
# because when grep $TOKILL exec it make entry in ps aux that we not whant 
