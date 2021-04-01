#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch mybar
echo "---" | tee -a /tmp/mybar-top.log /tmp/mybar-bottom.log
polybar -c ~/.config/polybar/config.ini mybar-top 2>&1 | tee -a /tmp/mybar-top.log & disown
polybar -c ~/.config/polybar/config.ini mybar-bottom 2>&1 | tee -a /tmp/mybar-bottom.log & disown

echo "Bars launched..."
