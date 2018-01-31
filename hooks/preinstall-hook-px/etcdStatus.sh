#!/bin/bash

# set -x
echo "Initializing..."
svcname=$1
echo $svcname
etcdURL=$(echo "$svcname" | awk -F: '{ st = index($0,":");print substr($0,st+1)}')
echo $etcdURL

response=$(curl --write-out %{http_code} --silent --output /dev/null "$etcdURL/version")
echo $response

if [[ "$response" != 200 ]]
then
    echo "Provided etcd url is not reachable. Exiting.." > /dev/termination-log
    exit 1
fi 
