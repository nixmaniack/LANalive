#!/bin/bash
#Author : Muneeb Shaikh (aka 'MasterOfMinds')
#E-mail : muneeb@reversehack.in
#Created: 20 Jan, 2011


if [ $# -ne 2 ]
then
    echo
    echo Usage: alive FROM TO
    echo
    exit 1
fi

echo
echo "Script to check alive hosts on LAN by Muneeb Shaikh"
echo

CLASS=192.168.1.
FROM=$1
TO=$2
COUNT=2

for myHost in $(seq $FROM $TO)
do
    count=$(ping -qc $COUNT ${CLASS}$myHost | grep 'received'| awk -F',' '{print $2}' | awk -F' ' '{print $1}')
    echo "Testing Host ${CLASS}$myHost"
    if [ $count -ne 0 ]; then
        echo "Host: [1;33m${CLASS}$myHost[0m is [1;32mUP[0m at $(date)"
        notify-send -u normal "Alive Hosts" "Host: $myHost is UP at $(date)"
    else
        echo "Host: [1;33m${CLASS}$myHost[0m is [1;31mDOWN[0m at $(date)"
    fi
done

echo
