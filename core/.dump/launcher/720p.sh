#!/bin/bash

printf "Press enter... "
read _
xrandr --output HDMI-1 --mode 1280x720

printf "Press enter..."
read _
xrandr --output HDMI-1 --mode 1920x1080

# Run ./720p.sh after chmod +x 720p.sh
