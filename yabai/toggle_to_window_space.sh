window=$1
focusedSpace=$(yabai -m query --spaces --space | jq -r '.index')
currentWindowSpace=$(yabai -m query --windows --window $window | jq -r '.space')

if [ $currentWindowSpace -eq $focusedSpace ]; then
    yabai -m space --focus recent
else
    yabai -m space --focus $currentWindowSpace
fi
