#!/bin/bash

# Custom i3 plugins launch script
# Starts all the plugins I am using with i3

# Polybar
exec $HOME/.config/polybar/launch.sh &

# sxhkd
exec $HOME/.config/sxhkd/launch.sh &
