#!/bin/sh

DOCKER_MACHINE_NAME="$1"

if [ -z "$DOCKER_MACHINE_NAME" ]
then 
    echo "docker-machine name not set"
    exit 1
fi
 

#Extracting env values
CONTENT=$( docker-machine env dev | grep "export"  )
JSON_VALUE_CONTENT=$( echo "$CONTENT" | sed 's/=/":/g' |  sed 's/export /"/g' | sed 's/$/,/g'  ) 
JSON_VALUE="{ ${JSON_VALUE_CONTENT%?} }"
#Output in JSON format 
echo $JSON_VALUE
