#!/bin/bash
 
 echo "Generating .env with param dev for service twitter-clone"
 
 aws ssm get-parameters-by-path --path "/dev/twitter-clone/" --with-decryption    --region ap-south-1 --query="Parameters[*].[Name, Value]"    --output text |
   while read line
   do
     name=$(echo ${line}} | cut -f 1 -d ' ' | sed -e "s//dev/twitter-clone///g")
     value=$(echo ${line} | cut -f 2 -d ' ')
     echo "${name}=${value}" >> .env
   done
 ls -lart
 npm run serve
