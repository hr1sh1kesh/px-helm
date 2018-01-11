#!/bin/sh

#set -x
echo "Initializing..."

svcname=$1
# echo $svcname
IFS=':' read -r id etcdURL <<< "$svcname"
echo $etcdURL
response=$(curl --write-out %{http_code} --silent --output /dev/null "$etcdURL/version")

if [[ "$response" != 200 ]]
then
    echo "Provided etcd url is not reachable. Exiting.."
    exit 1
fi 
