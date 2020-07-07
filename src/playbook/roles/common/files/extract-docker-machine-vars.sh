#!/bin/sh

DOCKER_MACHINE_NAME="$1"

if [ -z "$DOCKER_MACHINE_NAME" ]
then 
    echo "docker-machine name not set"
    exit 1
fi
 

#Extracting env values
CONTENT=$( docker-machine env $DOCKER_MACHINE_NAME | grep "export"  )
if [ "$?" != "0" ]
then 
    echo "failed to communicate with docker machine"
    exit 1
fi 
JSON_VALUE_CONTENT=$( echo "$CONTENT" | sed 's/=/":/g' |  sed 's/export /"/g' | sed 's/$/,/g'  ) 

IP_MACHINE=$( docker-machine ip $DOCKER_MACHINE_NAME )
JSON_VALUE="{ ${JSON_VALUE_CONTENT} \"DOCKER_HOST_IP\":\"$IP_MACHINE\"}"

#Output in JSON format 
echo $JSON_VALUE
