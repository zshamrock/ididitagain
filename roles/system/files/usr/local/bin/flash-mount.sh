#!/bin/bash
if [ $# -ne 1 -o $# -ne 2 ]
then
    echo "Device name is expected! Run 'dmesg' to see the device name."
    exit 1
fi
if [ $# -eq 1 ]; then
    fstype="vfat"
    device=$1
fi
if [ $# -eq 2 ]; then
    fstype=$1
    device=$2
fi
echo "Waiting to mount ${device} using ${fstype} on /media/flash..."
for i in '' '-b' '-c' '-d'
do
	if [ `grep -i /media/flash$i /etc/mtab | wc -l` -eq 0 ]
	then
	    echo "Mounting /media/flash$i..."
        sudo mount -t ${fstype} -o utf8,gid=staff,umask=007 ${device} "/media/flash$i"
        break
	fi	
done
echo "Flash is successfully mounted )"

