#! /bin/bash

SCREENSHOTPATH="$HOME/Pictures/Screenshots"

if [ ! -d $SCREENSHOTPATH ]; then
  mkdir -p $SCREENSHOTPATH
fi;

current_date="$(date +%Y%m%d-%H%M%S-%N)"
ext=".png"

screenshot_file="$SCREENSHOTPATH/screenshot-$current_date$ext"

grim -o $(swaymsg -t get_outputs | jq -r ".[] | select(.focused) | .name") $screenshot_file

wl-copy < $screenshot_file

