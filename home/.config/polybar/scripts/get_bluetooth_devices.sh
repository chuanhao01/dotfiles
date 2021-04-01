#!/bin/sh

# Made by: @chuanhao01
# Last updated date: 22/03/2021

# Adapted from https://github.com/polybar/polybar-scripts

red="%{B}%{F#ff0000}"
blue="%{B}%{F#287aa9}"
green="%{B}%{F#14ff5a}"
reset="%{B- F-}"

bluetooth_print() {
	raw_bluetooth_status=$(bluetoothctl show | grep Powered | xargs)
	IFS=' ' read -ra bluetooth_status <<< "$raw_bluetooth_status"
	bluetooth_status="${bluetooth_status[1]}"
	if [ "$bluetooth_status" = "yes" ]; then

        devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
        counter=0
        while read -r line; do
            device_info=$(bluetoothctl info "$line")

            if echo "$device_info" | grep -q "Connected: yes"; then
                device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)

                counter=$((counter + 1))
            fi
        done <<< "$(echo "$devices_paired")"

	    if [ $counter -eq 0 ]; then
                printf "%s No devices connected" "$blue"
	    else
                printf "%s devices:" "$green"
		        counter=0
                echo "$devices_paired" | while read -r line; do
                    device_info=$(bluetoothctl info "$line")

                    if echo "$device_info" | grep -q "Connected: yes"; then
                        device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)
                        if [ $counter -gt 0 ]; then
                            printf ", %s" "$device_alias"
                        else
                            printf " %s" "$device_alias"
                        fi
                        counter=$((counter + 1))
                    fi
            done
	    fi

            printf '%s' "$reset"
        else
            echo ""
        fi
}

# Function not used
bluetooth_toggle() {
    if bluetoothctl show | grep -q "Powered: no"; then
        bluetoothctl power on >> /dev/null
        sleep 1

        devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl connect "$line" >> /dev/null
        done
    else
        devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl disconnect "$line" >> /dev/null
        done

        bluetoothctl power off >> /dev/null
    fi
}

case "$1" in
    --toggle)
        bluetooth_toggle
        ;;
    *)
        bluetooth_print
        ;;
esac
