#!/bin/bash
addr=0x$(sudo cat /proc/kallsyms | grep 'T kallsyms_lookup_name' | awk '{print $1}')
device_name=$(ip rout | grep default | awk '{print $5}')
echo ${addr}
echo ${device_name}
sudo insmod kgdboe.ko kallsyms_lookup_name_address=${addr} device_name=${device_name}
dmesg | tail