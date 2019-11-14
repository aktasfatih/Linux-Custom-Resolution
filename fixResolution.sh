#!/bin/bash
echo "Script for setting up the resolution started."
echo "Getting resolution name"
RESOLUTION="1500 1000"
RES_NAME=$(cvt $RESOLUTION | grep -o "\".*\"")
echo "Resolution name: $RES_NAME"
CAL_MODE=$(cvt $RESOLUTION | grep -o "\".*$")
echo "Calculated mode: $CAL_MODE"
MON_NAME=$(xrandr --listmonitors | grep -o "  \w*$" | strings)
echo "Monitor name: $MON_NAME"
xrandr --addmode $MON_NAME $RES_NAME
echo "New Resolution is added"
xrandr --output Virtual1 --mode "$RES_NAME"
