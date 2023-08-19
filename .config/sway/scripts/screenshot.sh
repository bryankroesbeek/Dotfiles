#! /bin/bash

SCREENSHOTPATH="$HOME/Pictures/Screenshots"

if [ ! -d $SCREENSHOTPATH ]; then
  mkdir -p $SCREENSHOTPATH
fi;

area="$(slurp)"

if [ -z "$area" ]; then
  exit 0;
fi;

current_date="$(date +%Y%m%d-%H%M%S-%N)"
ext=".png"

screenshot_file="$SCREENSHOTPATH/screenshot-$current_date$ext"

grim -g "$area" $screenshot_file

wl-copy < $screenshot_file
