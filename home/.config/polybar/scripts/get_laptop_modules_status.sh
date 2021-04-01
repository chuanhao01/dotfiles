#!/bin/bash

# Made by: @chuanhao01
# Last updated date: 22/03/2021

# Colors
red="%{B}%{F#ff0000}"
green="%{B}%{F#14ff5a}"
blue="%{B}%{F#287aa9}"
grey="%{B}%{F#676e77}"
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

get_bluetooth_status() {
	raw_bluetooth_status=$(bluetoothctl show | grep Powered | xargs)
	IFS=' ' read -ra bluetooth_status <<< "$raw_bluetooth_status"
	bluetooth_status="${bluetooth_status[1]}"
	if [ "$bluetooth_status" = "no" ]; then
		echo "$red$reset"
	elif [ "$bluetooth_status" = "yes" ]; then
		echo "$blue$reset"
	else
		echo "$red$reset"
	fi
}

get_wifi_status() {
	wifi_power_status=$(nmcli network)
	if [ "$wifi_power_status" = "enabled" ]; then
		wifi_connection_name=$(nmcli connection show --active | grep wifi | awk '{print $1}')
		if [ "$wifi_connection_name" = "" ]; then
			# No wifi connection
			echo "$grey直$reset"
		else
			echo "$green直 $wifi_connection_name$reset"
		fi
	else
		# Wifi is disabled
		echo "$red睊$reset"
	fi
}

case "$1" in
	--none)
		echo ""
		;;
	*)
		echo "[ $(get_wifi_status)  $(get_bluetooth_status) $(get_gpu_status) ] "
		;;
esac
