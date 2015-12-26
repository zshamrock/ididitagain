#!/bin/bash
# script to turn off touchpad if mouse present at login
# synclient is the synaptic utility to manage the touchpad
# grep the "lsusb" output and do a wordcount on number of lines with "Logitech" which should = 1 if a Logitech mouse is present
#
# Obviously the "Logitech" should be replaced with your brand of mouse, and perhaps be more exact in case you have other USB devices that have similar names
/usr/bin/synclient touchpadoff=`lsusb | grep Logitech | wc -l`

