#!/usr/bin/env bash

# Simple launch script for sxhkd
# Will kill and start the daemon if there is already one

# Terminate already running daemons
killall -q sxhkd

# Start and log output of sxhkd
echo "---" | tee -a /tmp/sxhkd.log
sxhkd -c ~/.config/sxhkd/sxhkdrc 2>&1 | tee -a /tmp/sxhkd.log & disown
echo "sxhkd launched"
