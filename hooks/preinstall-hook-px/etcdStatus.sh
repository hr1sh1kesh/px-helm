#!/bin/bash

# set -x
echo "Initializing..."
svcname=$1

IFS=';' read -ra array <<< "$svcname"
for url in "${array[@]}"
do 
etcdURL=$(echo "$url" | awk -F: '{ st = index($0,":");print substr($0,st+1)}')

echo "Verifying if the provided etcd url is accessible: $etcdURL"

response=$(curl --write-out %{http_code} --silent --output /dev/null "$etcdURL/version")
echo "Response Code: $response"

if [[ "$response" != 200 ]]
then
    echo "Incorrect ETCD URL provided. It is either not reachable or is incorrect..."
    echo "Provided etcd url is not reachable or is incorrect. Exiting.." > /dev/termination-log
    exit 1
fi 
done
