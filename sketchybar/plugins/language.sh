#!/bin/bash

LANGUAGE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep 'KeyboardLayout Name' | sed -E 's/^.+ = \"?([^\"]+)\"?;$/\1/')

ICON="🇺🇸"

if [ "$LANGUAGE" = "U.S." ]; then
  ICON="🇺🇸"
elif [ "$LANGUAGE" = "Swerty" ]; then
  ICON="🇸🇪"
fi

sketchybar --set language icon=$ICON
