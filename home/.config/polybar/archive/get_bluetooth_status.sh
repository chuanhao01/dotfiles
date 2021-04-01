#!/bin/bash

get_bluetooth_status() {
	raw_bluetooth_status=$(bluetoothctl -- show | grep Powered | xargs)
	IFS=' ' read -ra bluetooth_status <<< "$raw_bluetooth_status"
	bluetooth_status="${bluetooth_status[1]}"
	if [ "$bluetooth_status" = "no" ]; then
		echo 
	elif [ "$bluetooth_status" = "yes" ]; then
		echo 
	else
		echo 
	fi
}

case "$1" in
	--none)
		echo ""
		;;
	*)
		echo $(get_bluetooth_status)
		;;
esac
