#!/bin/bash

# A script used to lock the screen and setups idle hooks
# Made mainly using i3lock, xbacklight and xidlehook
# You can find xidlehook here: https://github.com/jD91mZM2/xidlehook

# Done By: @chuanhao01
# Last updated time: 26/03/2021

# --- Configs to set ---
# For brightness dimming
# Percentage of brightness to dim to after lock
dim_brightness=5
#bright_brightness=20
# Time taken in s to dim after locking
dim_time=5
# Time taken in s to turn off the screen after dimming
off_time=30

# For i3lock
# Path of lock screen image
image_path="~/Pictures/wallpapers/windows_troll.png"
# Some colors
grey="3c3c3c"
white="ffffff"
purple="991dff"
# Ring configs
radius=140
ring_width=12
# Time and Date configs
time_str="\"%H:%M:%S\""
date_str="\"%A, %d %b(%m) %Y\""

# --- Grabbing values needed ---
original_brightness=$(xbacklight -get)

# --- Helper functions ---
set_brightness="xbacklight -set"

# --- Main functions ---
# Function to run before the lock
pre_lock() {
    # Nothing here for now
    return 0
}

# Lock command in a string
# i3lock needs the -n flag to not fork, so the lock will work properly
lock="\
	i3lock \
	-i $image_path \
	\
	--indicator \
	--pointer win \
	--insidecolor=$grey \
	\
	--radius $radius \
	--ringcolor=$purple \
	--ring-width=$ring_width \
	\
	--clock \
	--timestr=$time_str \
	--timecolor=$white \
	--datestr=$date_str \
	--datecolor=$white \
	-n \
	;
"

# Function to run after lock is cleared
post_lock="\
	$set_brightness $original_brightness;
	pkill xidlehook;
"

# Main function called when the script is ran
main() {
    # The first timer function also has the post lock function
    # The second timer function is called to setup the xidlehook for dimming the screen 
    $pre_lock
    xidlehook --once \
        --timer 0 "$lock $post_lock" "" \
        --timer 0 "xidlehook --timer $dim_time '$set_brightness $dim_brightness' '$set_brightness $original_brightness' --timer $off_time 'xset dpms force off' ''" ""
}

# Calling the main function
main
