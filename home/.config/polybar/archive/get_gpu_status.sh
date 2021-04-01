#!/bin/bash

# Colors
red="%{B}%{F#ff0000}"
green="%{B}%{F#14ff5a}"
reset="%{B- F-}"

# path to the bbswitch acpi
gpu_bbswitch_path="/proc/acpi/bbswitch"

get_gpu_status() {
	raw_gpu_output=$(cat $gpu_bbswitch_path)
	IFS=' ' read -ra gpu_status <<< "$raw_gpu_output"
	gpu_status="${gpu_status[1]}"
	if [ "$gpu_status" = "OFF" ]; then
		echo "$red逸$reset"
	elif [ "$gpu_status" = "ON" ]; then
		echo "$green辶$reset"
	else
		echo "$red$reset"
	fi
}

case "$1" in
	--none)
		echo ""
		;;
	*)
		echo $(get_gpu_status)
		;;
esac
