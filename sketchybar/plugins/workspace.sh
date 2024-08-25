#!/bin/sh

if [ "$FOCUSED" = "$NAME" ]; then
    sketchybar --set "$NAME" background.border_color=0x40ffffff
else
    sketchybar --set "$NAME" background.border_color=0x00ffffff
fi
