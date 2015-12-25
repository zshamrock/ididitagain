#!/bin/bash
if [ $# -ne 1 ]
then
    echo "Device name is expected! Run 'dmesg' to see the device name."
	exit 1
fi
echo "Waiting to mount /media/flash..."
for i in '' '-b' '-c' '-d'
do
	if [ `grep -i /media/flash$i /etc/mtab | wc -l` -eq 0 ]
	then
	    echo "Mounting /media/flash$i..."
		sudo mount -t vfat -o utf8,gid=staff,umask=007 $1 "/media/flash$i"
		break
	fi	
done
echo "Flash is successfully mounted )"

