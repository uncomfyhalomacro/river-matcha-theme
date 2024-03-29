#!/usr/bin/env bash
network=$(ip route get 1.1.1.1 | grep -Po '(?<=dev\s)\w+' | cut -f1 -d ' ')
interface_easyname=$(dmesg | grep $network | grep renamed | awk 'NF>1{print $NF}')
ping=$(ping -c 1 www.google.com | tail -1| awk '{print $4}' | cut -d '/' -f 2 | cut -d '.' -f 1)

if ! [ $network ]
then
   network_active="睊"
elif [[ $interface_easyname == *"wlan"* ]]
then
   network_active=""
else
   network_active=""
fi

#echo "{\"text\": \""$network_active $interface_easyname\(${ping}ms\)"\"}" | jq .text -r --unbuffered
echo "$network_active "
